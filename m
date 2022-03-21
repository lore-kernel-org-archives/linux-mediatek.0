Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A003C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Mar 2022 15:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HL5Hq6S1YnGhcxCiE6CKZJCZ1nXzaMs92YUvgHAEez4=; b=A2kRxeFBv+2njv
	rLvKMzoscsnJHrq1dy8tiQVSSRd+bGspSYCyA7bPpV7EB9Cl7AbPtySogntpdqVmAUB1GRJJy0DCY
	0TeYGIE0n2TM0dEI85ylLo8mbczf5JOcXoRgNBwekoBWDroY9rSaa7PFHHyProFJ11H5jSByK0rWW
	xc6D/McnfJokdt8Xf/kvpmVnZomsDZ6MrK98rbhgD4LbQ9kjLSAOXSdVtDRJY/sY6IQTbaajfhp47
	UvC9oKSE9C0majNuSgDvPnaYdD74EFW/6qEOhB7yY5gshgKqdbcf/GjFQGPA/ZHwDxBfhvwcd296X
	3HwwQvgGVnCMriTxVSIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWJtj-008C22-9P; Mon, 21 Mar 2022 15:24:43 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWJtN-008Bsp-8F; Mon, 21 Mar 2022 15:24:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BF94C6103A;
 Mon, 21 Mar 2022 15:24:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E90F9C340E8;
 Mon, 21 Mar 2022 15:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647876260;
 bh=rqWCgI0pdFsskA3ATgkPv9X39+w+Hwx3zvk/49aW8Os=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=M2MCqAUZlJo4kWzrePoWGz9Tm5ZuHhP7Arl9bftxAy6HBe+e4yn8zSkz/z97xdFN/
 nnzm1rew6dbhDR8VA5id5F6OUzU3UOk9W1FkQuIe2IFv3gi95qy5r2qqXyxeVsNt7I
 78DjfGGbR6UOZj/nBcsVtzwOu7RzenBf56n4nayYc0YfW00U40AhIm5/AXi6/+OdRq
 xdWzA6uTAjPBUuFlDdq72jw+TLtf1CIUEi3qWk+1HcitD+THJ3vJ/zQufGYe0NKoRI
 MPHpRpwi9ZCoP022eQARIEbFdhNc1GM2zdd16pjgut2LgTNZln9GkA/omFRtEXin76
 Qp5pKl1qbWebQ==
Date: Mon, 21 Mar 2022 23:24:15 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Cc: broonie@kernel.org, robh+dt@kernel.org, devicetree@vger.kernel.org,
 linmq006@gmail.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, trevor.wu@mediatek.com,
 matthias.bgg@gmail.com, aaronyu@google.com,
 linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Subject: Re: [v5 3/4] ASoC: mediatek: mt8192: refactor for I2S8/I2S9 DAI
 links of headset
Message-ID: <YjiYn7exjUMtLq4M@google.com>
References: <20220319114111.11496-1-jiaxin.yu@mediatek.com>
 <20220319114111.11496-4-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220319114111.11496-4-jiaxin.yu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220321_082421_377542_4CE37F9F 
X-CRM114-Status: UNSURE (   7.89  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, Mar 19, 2022 at 07:41:10PM +0800, Jiaxin Yu wrote:
> MT8192 platform use rt5682 codec, so through the snd_soc_of_get_dai_link_codes()
> to complete the configuration of I2S8/I2S9 dai_link's codecs.
> 
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
