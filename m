Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8667FC3DA7F
	for <linux-mediatek@archiver.kernel.org>; Sun,  4 Aug 2024 09:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=weetxJmtLY1cKNQbg86zrhIOgcbPA/fjVq4T3M5ovLc=; b=Syxe4tIRkpkBN833VMjrH5nA47
	h5QvXGXICqhAmjviRP8ElXOevmQcWohIWe/MDNOmzuVutZKp7OFnjzsa/DB5YzqQ4wwMhpNz7e53h
	2Uo5FbVg90JnvDhRCF7wbVnu31fc/+dr2XA/Qjo2HChyUM+mCYcWzb+BomQDDTB4Hie50Sx01/54P
	fG+7kVHZ9J4Z9oYiOexspUbYNvW8f9jHPNWe2PDNBPA3nO8ZLrLiEuBF17jMYx+1nxF7mO2vnuyVR
	0AmcghLBXpB6eFi2FV6dez5Uujr5E+GlaSwF7hkJkvTX1eg9YYPKPDbQeyN5/fF7RE1v3UZy9ODwe
	NJG6iUWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1saXys-0000000D2wW-3igv;
	Sun, 04 Aug 2024 09:56:50 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1saXyK-0000000D2nS-3oo0;
	Sun, 04 Aug 2024 09:56:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 87169CE0947;
	Sun,  4 Aug 2024 09:56:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23D25C32786;
	Sun,  4 Aug 2024 09:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722765373;
	bh=6GYgW1pBDBnhlAKtizrPp43IWcryMt4Azi1dzXoCvgc=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=oDiLJOnwzA0J4o0OpLS6Q0pkgt/1WpuYclKUFXXJHLAwMsSp+GfesATO+Mg0DwIUU
	 mncuCeSX1ffvQ0SFplZhTAyQq/9ivBchR7ZZkQ8D5orkq+MYOvQaqgFIHsom9vSinV
	 7RR/QDDCemM+0blfVkS/DHE4HEv0vZBDzSiYA9SyFlCt6ZiIzLtGejwlGx8iU/9b6W
	 jDhLIq4ZFZnjGwZxWL67wAHXMZ4zUMfY+unU94Qc8rXQuNr+Mxxcpy8DbHawHU3KZ2
	 JPgG9cLXr8fvFsfV+RmBusS9ziPscrH9qo3leD7VK1Cxe9QAzph40WdBoGmEEd5GNI
	 ZT2AeIGJNvE8Q==
From: Kalle Valo <kvalo@kernel.org>
To: Shengyu Qu <wiagn233@outlook.com>
Cc: kernel test robot <lkp@intel.com>,  nbd@nbd.name,  lorenzo@kernel.org,
  ryder.lee@mediatek.com,  shayne.chen@mediatek.com,
  sean.wang@mediatek.com,  matthias.bgg@gmail.com,
  angelogioacchino.delregno@collabora.com,  chui-hao.chiu@mediatek.com,
  emmanuel.grumbach@intel.com,  StanleyYP.Wang@mediatek.com,
  meichia.chiu@mediatek.com,  johannes.berg@intel.com,
  quic_adisi@quicinc.com,  allen.ye@mediatek.com,  bo.jiao@mediatek.com,
  linux-wireless@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,
  linux-mediatek@lists.infradead.org,  oe-kbuild-all@lists.linux.dev,
  Sujuan Chen <sujuan.chen@mediatek.com>
Subject: Re: [PATCH v5] wifi: mt76: mt7915: add wds support when wed is enabled
References: <TY3P286MB2611CB2F4F5FA27D782AA80A98BC2@TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM>
	<202408041039.BqVRJOqp-lkp@intel.com>
	<TY3P286MB2611C363575C77278946A4B498BD2@TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM>
Date: Sun, 04 Aug 2024 12:56:07 +0300
In-Reply-To: <TY3P286MB2611C363575C77278946A4B498BD2@TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM>
	(Shengyu Qu's message of "Sun, 4 Aug 2024 17:28:20 +0800")
Message-ID: <87o7687gso.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240804_025617_143487_2FBA1BE7 
X-CRM114-Status: UNSURE (   7.79  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Shengyu Qu <wiagn233@outlook.com> writes:

> This error report is a false warning. "struct mtk_wed_device" needs
> "CONFIG_NET_MEDIATEK_SOC_WED" to be defined.

I didn't investigate anything but based on your description that sounds
wrong. The code should should not be compiled if it depends on
CONFIG_NET_MEDIATEK_SOC_WED but that's not set. We have zero rule for
compilation errors or warnings.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

