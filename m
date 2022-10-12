Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57EB6C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Oct 2022 17:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Z6Fiwy2e23XKHWcxR8x7pTNqe//6r8ayWOYB+1WzF4=; b=qRnibtDeD303TG9RiOTB50f63r
	Va97Rb2sPFc6nAXW35uuWRR9wt1PTtpIZw7IsA9TDxWpOeL9VA/P+8Ii4/D5SqsX8YuvthUdoEp8c
	/73IapTmtqRPO5BBwd9681dZOkuZbUN+nM/mLdHuzrOSKlKeCfRuB/B1AYu2BuZHs7d+kMrYGY59V
	5Z03nMEdRWIZCC0iPI6UHpapOAp8MkiEJv2yjK5SV/z09ptepefdVVu+n/CSK2PFjLajKNv2XaHfJ
	qShJLqcFBIeQlbls63U3FmCaN+Fc1jUmxYfa/2ywsQyzY5GTlAybEoeWHS66n4JolKMUvuflAyzbB
	MrrfhMUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oifBk-008nfK-Jc; Wed, 12 Oct 2022 17:06:36 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oifBh-008neL-SC
	for linux-mediatek@lists.infradead.org; Wed, 12 Oct 2022 17:06:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 75B1AB8161D
	for <linux-mediatek@lists.infradead.org>; Wed, 12 Oct 2022 17:06:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28B48C433C1
	for <linux-mediatek@lists.infradead.org>; Wed, 12 Oct 2022 17:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665594391;
	bh=B+S46y1hW0O9Zhjqx+GVuX72AMv9m1uQMX2+DHq/4+w=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=lnoS7Yl5T5R2lGXhj3KcLKqGBEvh+BQQZbBx79D3fqKJ4hdj9Fom3C+oN6JDoSjzi
	 NQ/bnmFOAGSMMusqmLALGc3R7Vpcvnnqg9l0b+RtkGKINKAovbVUazPOqgh7nqQbUt
	 F1vab6kznEVMwHM2guMLitIuvJr10xOOyWsVfu4HGZcGHUd6qoQneL8ki/bO2ASo8K
	 T5UCs3n1A2PQTkrS9uL/hFCbzxDNBj3kzdtTwuhhUcRDAjvSF8dAph4hbFsZoJ5/HF
	 GaC+hXlqmz2eHs3qVst3CfzjzUedgxkQ3FBEIcDeLXf511eKk+RWX2qhoLGXNpLLlL
	 bIElK1AA0lB5A==
Received: by mail-oo1-f41.google.com with SMTP id c13-20020a4ac30d000000b0047663e3e16bso12543155ooq.6
        for <linux-mediatek@lists.infradead.org>; Wed, 12 Oct 2022 10:06:31 -0700 (PDT)
X-Gm-Message-State: ACrzQf1HWJyPIsBOB0yUzrApPHOeGM28rJIjjcGMYFsy/5bLYsJfkcy+
	d2Y/is24GEntMq+1pv5k/s/EgbJJCZ0PzEg1Wgk=
X-Google-Smtp-Source: AMsMyM6HBaz7V3Nekh4R4ISqCy/u2+AmcL5d+4SdUXmjjSiFvf/t/e5JOMdACso+vrgy7xZvO26lGSMfrP5ca+uKaRE=
X-Received: by 2002:a05:6820:1890:b0:480:623d:61f9 with SMTP id
 bm16-20020a056820189000b00480623d61f9mr8280661oob.45.1665594390302; Wed, 12
 Oct 2022 10:06:30 -0700 (PDT)
MIME-Version: 1.0
References: <676d04caef93b8608ef14aebfbeb06a7b4af9cd3.camel@mediatek.com>
In-Reply-To: <676d04caef93b8608ef14aebfbeb06a7b4af9cd3.camel@mediatek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Wed, 12 Oct 2022 13:06:19 -0400
X-Gmail-Original-Message-ID: <CA+5PVA5743hCTekT974gOB8qk5mm_7kO+nadg=mUQyyUWnyEMA@mail.gmail.com>
Message-ID: <CA+5PVA5743hCTekT974gOB8qk5mm_7kO+nadg=mUQyyUWnyEMA@mail.gmail.com>
Subject: Re: [PULL] mediatek: Update mt8195 SOF firmware to v0.4.1
To: =?UTF-8?B?VGluZ0hhbiBTaGVuICjmsojlu7fnv7Ap?= <TingHan.Shen@mediatek.com>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221012_100634_067034_F75CBE1C 
X-CRM114-Status: GOOD (  18.33  )
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

On Tue, Oct 11, 2022 at 7:32 AM TingHan Shen (=E6=B2=88=E5=BB=B7=E7=BF=B0)
<TingHan.Shen@mediatek.com> wrote:
>
> Hi maintainers,
>
> This pull request updates MT8195 SOF firmware.
>
> If there is any problem, please let me know.
> Thank you.
>
> Best regards,
> TingHan
>
> --
>
> The following changes since commit fdf1a65258522edf18a0a1768fbafa61ed07e5=
98:
>
>   linux-firmware: Update AMD cpu microcode (2022-09-30 17:33:35 -0400)
>
> are available in the Git repository at:
>
>   https://github.com/tinghan-shen/linux_fw_scp mtk-20221011
>
> for you to fetch changes up to 675bd6a24ba15d0d9a0550158a1b2c5102aa0337:
>
>   mediatek: Update mt8195 SOF firmware to v0.4.1 (2022-10-11 19:07:12 +08=
00)
>
> ----------------------------------------------------------------
> Tinghan Shen (1):
>       mediatek: Update mt8195 SOF firmware to v0.4.1

Pulled and pushed out.  Thank you.

josh

>
>  WHENCE                                                     |   2 +-
>  mediatek/sof-tplg/sof-mt8195-mt6359-rt1019-rt5682-dts.tplg | Bin 20895 -=
> 20895 bytes
>  mediatek/sof/sof-mt8195.ldc                                | Bin 40568 -=
> 51168 bytes
>  mediatek/sof/sof-mt8195.ri                                 | Bin 100740 =
-> 173832 bytes
>  4 files changed, 1 insertion(+), 1 deletion(-)

