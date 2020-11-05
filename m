Return-Path: <SRS0=qi5H=EL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A655C00A89
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Nov 2020 13:27:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AFA2820719
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Nov 2020 13:27:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="xsMX7DWe";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="BJFp4CeD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AFA2820719
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yF9BI9fqzjTd09XwMnLbKLTnW568Zq/SMpNjSOWYP+w=; b=xsMX7DWemh0Q4ItyiDFv5V6jq
	S+9wv5gY53NkZ0FuEB1q4dBBhHXreNIH2flTlMmO3OqiBY99EhhAw4KFwuMf8EVYgD5QkR/rnz8kB
	U2ARgXo29nYmo70loD6LMnL2mJr2cS3PGvAl6aGvKboLy7fWGlssd0wSfF/d9kkt4Gh2/12EXIQBn
	J3ae6RWMrDGtcoY0PlKBnVLm6+bvUz/awpPfNgcWq9SCcM7cP/3vs9eihq7icw7MrEB6YFRLi2BZL
	r/A6o2CpgvPgN0jfveF6C5D3Xq6Jx1XUZpu4QvpkSAUHzlNjZnD0aYfxXpV3fxhebX+fNf2I7UigG
	fvuHKRMfA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kafIV-0000nA-H7; Thu, 05 Nov 2020 13:27:27 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kafIR-0000m8-Qj; Thu, 05 Nov 2020 13:27:25 +0000
X-UUID: daa7e1f828334f64a8849f813e2f37f1-20201105
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=pcnmHbDQu8GbyyLey8ydD5w9czPlndqFD5Nfo7Y2uWo=; 
 b=BJFp4CeDNTLhAImvpbmcRUVrD6suw/DRxo18fc5U14f0HQ3Lm4tV39SJ6WeVncZy9DiWZkKYV9W2AfxAleCdLKfdb0UsAJVuFSScFI5zb/txwWh5JEeXDzNbXBhTSsGGcWsBqHI0CD2Agx8YkEliS9WypTXl/g/kTFrDvbLs2eQ=;
X-UUID: daa7e1f828334f64a8849f813e2f37f1-20201105
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 731729646; Thu, 05 Nov 2020 05:27:14 -0800
Received: from MTKMBS33N1.mediatek.inc (172.27.4.75) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 5 Nov 2020 05:27:12 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N1.mediatek.inc
 (172.27.4.75) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 5 Nov 2020 21:27:09 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 5 Nov 2020 21:27:09 +0800
Message-ID: <1604582829.26523.17.camel@mhfsdcap03>
Subject: Re: [PATCH -next v2] ASoC: mediatek: mt8192: Make some symbols static
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: Zou Wei <zou_wei@huawei.com>
Date: Thu, 5 Nov 2020 21:27:09 +0800
In-Reply-To: <1604579287-25251-1-git-send-email-zou_wei@huawei.com>
References: <1604579287-25251-1-git-send-email-zou_wei@huawei.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 4E3BCA4F16C884482DEDA47F609076C23E9CAA032D1A648EB2745A62481CDE4C2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201105_082724_070847_E25D5A3E 
X-CRM114-Status: UNSURE (   8.05  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, broonie@kernel.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, perex@perex.cz, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2020-11-05 at 20:28 +0800, Zou Wei wrote:
> Fix the following sparse warnings:
> 
> ./mt8192-dai-i2s.c:2040:5: warning: symbol 'mt8192_dai_i2s_get_share' was not declared. Should it be static?
> ./mt8192-dai-i2s.c:2060:5: warning: symbol 'mt8192_dai_i2s_set_priv' was not declared. Should it be static?
> ./mt8192-afe-gpio.c:15:16: warning: symbol 'aud_pinctrl' was not declared. Should it be static?
> ./mt8192-afe-pcm.c:70:5: warning: symbol 'mt8192_get_memif_pbuf_size' was not declared. Should it be static?
> ./mt8192-afe-pcm.c:2137:39: warning: symbol 'mt8192_afe_component' was not declared. Should it be static?
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Zou Wei <zou_wei@huawei.com>

Acked-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
Thanks for the fixing.
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
