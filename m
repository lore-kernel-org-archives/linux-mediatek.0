Return-Path: <SRS0=xu2G=EK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F03AC2D0A3
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Nov 2020 18:57:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E07312087D
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Nov 2020 18:57:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kSNF5PXq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E07312087D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DZfyFsOJCCqCoBCM9zu63LK1zy2LZt6r4G/Tp61Ybl0=; b=kSNF5PXqTa5o7jpdw/8zILkd6
	o677Z0WV4HIfm4cRhI1lSnEiOCAk57hlgr3G57xRqXCAz3o+R8hlGDnlMKtY10KHgvVzv+YZ/A6s4
	NpVYzrWt8kPlerK0OyNgxrwx2wb6XKyG3Oqgq/ukIt4FbB7w1XuEO+mom2vKDWRAvFaIwiUtEtnmi
	mqGVeIsii3ta8SOXG1KFHRv63TwSXoS8OnUWcVnQRY3bVsgSwOze6Yy+M1S2+hE8fmWP3Vq7Qbv3h
	J4FqTSC5kcDZpyIpHHvpdYqxORBJRxar3Nep6UxA6maxj78R59aZ7PIpqtXn+y05k3cDEwnwXHlx8
	1HsYrgpdQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kaNxp-0002No-TO; Wed, 04 Nov 2020 18:56:57 +0000
Received: from mail-ot1-f68.google.com ([209.85.210.68])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaNxn-0002MZ-U2; Wed, 04 Nov 2020 18:56:56 +0000
Received: by mail-ot1-f68.google.com with SMTP id k3so8430105otp.12;
 Wed, 04 Nov 2020 10:56:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=VFWuzwJSbzZgP3QJ9+E0rWgVzccQnC1YvFD5b/UokjA=;
 b=a3X3y27IhsTo6iP7duTivVocui7dL+DSFpis7rK8TVcLpjhCOZhrwAEbO0lVWXpfaL
 wx+je9vwrv399Jk64fKQ+L6PNIB+R8FgHQqQKcxC2L4HeiwMuxTNmXPcNJccEpomPmDG
 Z65eYhwlpJ/wEeXr9Mc+rcO4FAFsA1oZ7ajDZMarhfJ8yR4CRZ5WflzVcScz5gu2Ac9V
 WZ0Be1St+4ctwt0i9O0yVJlXPPM5xPqhQvqPjNOeDOSd0zIxjAxXbyMsQVAzZolYUXK8
 /RCPyQnz2/1Ji10z4lyn9unLD2K3qgzG1bnurZtOdceuv3mnex8dncmDioWm/8gzTLrZ
 OV4w==
X-Gm-Message-State: AOAM532qT39RVw7lSuCgF9T3UpNFaltqmh3Zsv2lgnx1AVH09W+WJ1j1
 IFoG2RlTpxRqIWxbHT8NcQ==
X-Google-Smtp-Source: ABdhPJws0729OuS+J73/HqFJI9wECuK1AqYDP1g32egUbxndlt30IEgUrdNjDMDR5RzcZc2UJAjHSQ==
X-Received: by 2002:a05:6830:2ef:: with SMTP id
 r15mr5683837ote.261.1604516212970; 
 Wed, 04 Nov 2020 10:56:52 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id y22sm735450ooa.2.2020.11.04.10.56.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 10:56:52 -0800 (PST)
Received: (nullmailer pid 3947080 invoked by uid 1000);
 Wed, 04 Nov 2020 18:56:51 -0000
Date: Wed, 4 Nov 2020 12:56:51 -0600
From: Rob Herring <robh@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Subject: Re: [PATCH v4 7/9] dt-bindings: mediatek: mt8192: add audio afe
 document
Message-ID: <20201104185651.GB3946406@bogus>
References: <1604390378-23993-1-git-send-email-jiaxin.yu@mediatek.com>
 <1604390378-23993-8-git-send-email-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1604390378-23993-8-git-send-email-jiaxin.yu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201104_135655_979333_AD417178 
X-CRM114-Status: GOOD (  14.74  )
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, tzungbi@google.com,
 Bicycle.Tsai@mediatek.com, tiwai@suse.com, robh+dt@kernel.org,
 shane.chien@mediatek.com, broonie@kernel.org,
 linux-mediatek@lists.infradead.org, Trevor.Wu@mediatek.com,
 p.zabel@pengutronix.de, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 03 Nov 2020 15:59:36 +0800, Jiaxin Yu wrote:
> This patch adds mt8192 audio afe document.
> 
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> ---
> This patch depends on following series that has not been accepted:
> https://patchwork.kernel.org/cover/11752231
> (dt-bindings/clock/mt8192-clk.h is included in it.)
> https://patchwork.kernel.org/patch/11755895
> (dt-bindings/power/mt8192-power.h is included in it.)
> https://lore.kernel.org/patchwork/patch/1321118
> (dt-bindings/reset-controller/mt8192-resets.h is included in it.)
> 
>  .../bindings/sound/mt8192-afe-pcm.yaml        | 100 ++++++++++++++++++
>  1 file changed, 100 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml:10:4: [warning] wrong indentation: expected 2 but found 3 (indentation)
./Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml:15:7: [warning] wrong indentation: expected 4 but found 6 (indentation)

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/sound/mt8192-afe-pcm.example.dts:19:18: fatal error: dt-bindings/clock/mt8192-clk.h: No such file or directory
   19 |         #include <dt-bindings/clock/mt8192-clk.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:342: Documentation/devicetree/bindings/sound/mt8192-afe-pcm.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1364: dt_binding_check] Error 2


See https://patchwork.ozlabs.org/patch/1392703

The base for the patch is generally the last rc1. Any dependencies
should be noted.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
