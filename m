Return-Path: <SRS0=XLXJ=EQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D413C56201
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Nov 2020 08:50:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8386020780
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Nov 2020 08:50:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RXYXDFpS";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="sTP4mDFQ";
	dkim=temperror (0-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="iD9hVFzR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8386020780
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kroah.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HkM+lRGMnOgBwDxM81vYCu1Y6DaACP3bH1XqXKP7+lw=; b=RXYXDFpSFyERFG3MLorV/JKpc
	UrUUbX1//8Ncq2iBME9sUGxygYGOhS9FImNl578b4QaA3kS189pN1TY4hbsyDyzAIQFKZA77JF47m
	5WlB1dkQf7kpQsMUlQr4YQBIGCRaChtYRAMgvXzNLZt7MUscbAVFOBCEmLZg8m/4OeMBBLeDYFt4q
	YthNn/S2Pmot6RvsIUtrDCxVzJ10H6jsWGx9c8IUQzGdI0rKALWkrWcdpdEOS4/2zA5SfinzkADLD
	+y8ASSaFBiEPgKDDZfP+P3/yrv50768h/3o5/hbcxe59JFtZeaWa1aAdkhMt+dBzKo4VPaeHEuq3d
	vEaCxWRTA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcPLo-0007hb-RX; Tue, 10 Nov 2020 08:50:04 +0000
Received: from new4-smtp.messagingengine.com ([66.111.4.230])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcPLk-0007fg-8D; Tue, 10 Nov 2020 08:50:01 +0000
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 2E8685803CF;
 Tue, 10 Nov 2020 03:49:55 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 10 Nov 2020 03:49:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=9s3HXA62aXEwuhDqThUDrB2tZR/
 QFmCSXDsh87Vt2VQ=; b=sTP4mDFQaTuABEN3HT4ghPaXmUs+3q36wIKNgmenbJC
 Thrv4yv9IBEmZSJ/GO1JXJ721q6Jq0Uhh63X151o/t7sulK4RmbrAs2jebzvHr96
 zwn0wuYRNIbkh8MLkJIpfLRs8P05bz7vGmNNp1fvqV7OjZvo8ecStqAPSCYWC6Kf
 4rkw1/5Y36NTJyoDeaurHSl7P2Lw3npS9zeuvAJ3j7NaXTfSdcIaQ9F0+rwrn9k6
 UGDZlUJ6j/fEN5663LqKqKLGQPP8Q3JkRlIv9s/YmxnrYzsanyCnj0F0ZMGcXs/n
 0y2wBAYvaAHD9AdUsHqVZ+7wWR88TScAiggD78Dvp6A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=9s3HXA
 62aXEwuhDqThUDrB2tZR/QFmCSXDsh87Vt2VQ=; b=iD9hVFzRap+aS8KMlgoNbq
 6YTx0nZBuZ3vn7lC+1uOzxq2tEweH8CUoBkGFiMNJsI4LmLeE/FmcEsPnkcYXNZj
 wCcjGT8TSWrVBQbbYwYblOAQiPDUzy3ZvL9LOu7GNXrWNhDyLhP5WQPF56ne6G8J
 S0qA/8mM2A0JPpg7ZM/QVqSpyOxnJzGXbiZR6SDhUZIAWrOwRI9QGjuYZQses3y2
 VoforsK0qqCFYAno3aRB1FxGrXQYdonw6GqHVUGSCgZxSXG1xD1s3DKX6q1SajC6
 Tt2xDT/LuEwm8zE3oOEGGEfoO+mcfZ91NIlc3pGdZroBa7rvWGao+K8ANKo32rzg
 ==
X-ME-Sender: <xms:MVSqX1XaQGH6eE-Mp7CA-6tXEILG5jMedm8iQ-RkxrSr6LYgwMb5Gg>
 <xme:MVSqX1lwF_FyIBlwBTjkQO4Q93lBSdRh1r2ux7pxJbAk1Gz0kTKuV7XOLT6v0tunl
 cHWMtiNXyvkLg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudduiedguddviecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghg
 ucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhephfduhe
 ffteefjeekvdffffevveelfeehhfeutedtgfeigeetvdfhvedvfefhjeeknecuffhomhgr
 ihhnpegthhgvtghkphgrthgthhdrphhlnecukfhppeekfedrkeeirdejgedrieegnecuve
 hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehk
 rhhorghhrdgtohhm
X-ME-Proxy: <xmx:MVSqXxYkV21P3H_SEpIh6oy7Bcz5rLphVsz76W69qlEDIiToY0R-1g>
 <xmx:MVSqX4WNsXWWrDiwvgISWbyXvuCU-s-D1wIzEalQcKjTEaCAa-dflg>
 <xmx:MVSqX_mDnqpPPnY_2u9RKSRaHPJG40wMtWmBaoA_hUrlAxZcPTDRtw>
 <xmx:M1SqXx0OiBo8aUsWe5OqJZDqDQIuum2sW_gtC_Tszc5CO-BDkMuycA>
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7CD553063081;
 Tue, 10 Nov 2020 03:49:53 -0500 (EST)
Date: Tue, 10 Nov 2020 09:50:49 +0100
From: Greg KH <greg@kroah.com>
To: Macpaul Lin <macpaul.lin@mediatek.com>
Subject: Re: [PATCH v2] ALSA: usb-audio: disable 96khz support for HUAWEI
 USB-C HEADSET
Message-ID: <X6pUaatZ7aML4sKq@kroah.com>
References: <1604995443-30453-1-git-send-email-macpaul.lin@mediatek.com>
 <1604997774-13593-1-git-send-email-macpaul.lin@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1604997774-13593-1-git-send-email-macpaul.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201110_035000_392118_7BB85F58 
X-CRM114-Status: GOOD (  17.29  )
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
Cc: alsa-devel@alsa-project.org, linux-usb@vger.kernel.org,
 Mediatek WSD Upstream <wsd_upstream@mediatek.com>,
 Christopher Swenson <swenson@swenson.io>, linux-kernel@vger.kernel.org,
 Macpaul Lin <macpaul@gmail.com>, Eddie Hung <eddie.hung@mediatek.com>,
 Takashi Iwai <tiwai@suse.com>, stable@vger.kernel.org,
 Jaroslav Kysela <perex@perex.cz>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Alexander Tsoy <alexander@tsoy.me>, linux-mediatek@lists.infradead.org,
 Nick Kossifidis <mickflemm@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Nicola Lunghi <nick83ola@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Ainge Hsu <ainge.hsu@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Nov 10, 2020 at 04:42:54PM +0800, Macpaul Lin wrote:
> The HUAWEI USB-C headset (VID:0x12d1, PID:0x3a07) reported it supports
> 96khz. However there will be some random issue under 96khz.
> Not sure if there is any alternate setting could be applied.
> Hence 48khz is suggested to be applied at this moment.
> 
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> Signed-off-by: Eddie Hung <eddie.hung@mediatek.com>
> Cc: stable@vger.kernel.org
> ---
> Changes for v2:
>   - Fix build error.
>   - Add Cc: stable@vger.kernel.org
> 
>  sound/usb/format.c |    6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/sound/usb/format.c b/sound/usb/format.c
> index 1b28d01..7a4837b 100644
> --- a/sound/usb/format.c
> +++ b/sound/usb/format.c
> @@ -202,6 +202,7 @@ static int parse_audio_format_rates_v1(struct snd_usb_audio *chip, struct audiof
>  		fp->rate_min = fp->rate_max = 0;
>  		for (r = 0, idx = offset + 1; r < nr_rates; r++, idx += 3) {
>  			unsigned int rate = combine_triple(&fmt[idx]);
> +			struct usb_device *udev = chip->dev;
>  			if (!rate)
>  				continue;
>  			/* C-Media CM6501 mislabels its 96 kHz altsetting */

Did you run this patch through checkpatch.pl?


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
