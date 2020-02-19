Return-Path: <SRS0=zz1H=4H=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57059C34047
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Feb 2020 12:32:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 15A0921D56
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Feb 2020 12:32:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PP1ExKQ+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="v2JIwPKZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 15A0921D56
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZJn/xwemSGFiQbpqfq84IRfieXGKAGLkM7462CmKg1I=; b=PP1ExKQ+ab1JCp
	iMw4HIEErAPa/WIN2Hpuh/pS3OQSnXVGt+83+u/iKD/zg1H4osEYv53h3lB4B1qRhYgj27ALMNVKN
	mYCHT5Q0jFkxC5BVuVdi/PbbOGCoSLa4ZoTg1FChFaYFNdlbMM4VLhNvkvR9409Opc0zblVRcIfQf
	JMcxdwVh5lAdVVs+LINsiqPwhZFU8BA0bREJBRBKacmPuiNGG4T37zfrZq8U9sGNlfSpJrVC6mr76
	/ineCyu6PTWWhFXuDyoIPq84fUsY5H5vh4bt7qcPSjKSpZj3NSh5XOyFFuA49xlRN5Aw4EbKeJWEl
	p5u8d9MQO7kl2NsKK4kg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4OWr-0005f8-9Y; Wed, 19 Feb 2020 12:32:37 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4OWe-0005Vp-RY; Wed, 19 Feb 2020 12:32:26 +0000
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
 [209.85.222.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0B5AD21D56;
 Wed, 19 Feb 2020 12:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1582115544;
 bh=rQLJgipmlA/J0x8qYVNwChZfoUkcJu+Lgm8+HW4iZzM=;
 h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
 b=v2JIwPKZh9fkwtMSlz8fGZMHPM5CoZ/WyPJCCAlbGZowpvhB3wn80T8159JQ8Q0VB
 jhveTQs9a+KKktG0sefaUC2IT+AUV2CoFxKnyalLPSMSM3rfyJejlv+hE3SQ/7jqv2
 17BQTYraZe79zh2uP2VOTTyJxqrKuUtyHgrlF9/4=
Received: by mail-qk1-f169.google.com with SMTP id a2so22731915qko.12;
 Wed, 19 Feb 2020 04:32:24 -0800 (PST)
X-Gm-Message-State: APjAAAWyQItcTNVG1XOmZ9IiXIlLCIOSwBGAmHMv8sDoZxU4FEMv5/Mz
 uF2iDKPxF1K2ptLqJqAn5aPOrBDzhtg2b7AAktc=
X-Google-Smtp-Source: APXvYqyYbSlrgoOVMio4VbdRpfZqdoVp+jaZdX4Gx4S9LVzr/bZxAZhbKRq9gJWfd2ujLmWJLj4uwHnSONCco6EONkQ=
X-Received: by 2002:ae9:ed10:: with SMTP id c16mr22229007qkg.95.1582115543191; 
 Wed, 19 Feb 2020 04:32:23 -0800 (PST)
MIME-Version: 1.0
References: <20200218100358.2015-1-gtk_ruiwang@mediatek.com>
In-Reply-To: <20200218100358.2015-1-gtk_ruiwang@mediatek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Wed, 19 Feb 2020 07:32:12 -0500
X-Gmail-Original-Message-ID: <CA+5PVA4K1jtuvQWBOMuORJC-VRMUs7t+T4_SpX08xw7SuQn+AA@mail.gmail.com>
Message-ID: <CA+5PVA4K1jtuvQWBOMuORJC-VRMUs7t+T4_SpX08xw7SuQn+AA@mail.gmail.com>
Subject: Re: pull request: linux-firmware: Update Mediatek MT8173 VPU firmware
To: gtk_ruiwang@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200219_043224_907982_2621A591 
X-CRM114-Status: GOOD (  15.69  )
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
List-Id: <linux-firmware.lore.kernel.org>
Cc: Maoguang Meng <maoguang.meng@mediatek.com>,
 Alexandre Courbot <acourbot@chromium.org>, srv_heupstream@mediatek.com,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Longfei Wang <longfei.wang@mediatek.com>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 Linux Firmware <linux-firmware@kernel.org>, Tomasz Figa <tfiga@chromium.org>,
 linux-mediatek@lists.infradead.org, PoChun.Lin@mediatek.com,
 Tiffany Lin <tiffany.lin@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Feb 18, 2020 at 5:04 AM <gtk_ruiwang@mediatek.com> wrote:
>
> Hi linux-firmware maintainers,
>
> The following changes since commit 6f89735800fe3af761104defdb81b50b6d6402f0:
>
>   rtl_nic: update firmware for RTL8153A (2020-02-07 08:30:37 -0500)
>
> are available in the Git repository at:
>
>   https://github.com/ruiwang-mtk/linux_fw_vpu_v1.1.4.git
>
> for you to fetch changes up to 0bd965d5e4b0d24e2fc054a933fea3a8c22af92b:
>
>   mediatek: update MT8173 VPU firmware to v1.1.4 (2020-02-18 17:27:30 +0800)
>
> ----------------------------------------------------------------
> gtk_ruiwang (1):
>       mediatek: update MT8173 VPU firmware to v1.1.4
>
>  vpu_d.bin | Bin 2977136 -> 2977184 bytes
>  vpu_p.bin | Bin 131180 -> 131180 bytes
>  2 files changed, 0 insertions(+), 0 deletions(-)

Pulled and pushed out.

josh

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
