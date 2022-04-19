Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 697ABC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Apr 2022 12:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SM24Jjld+pNp4p0Zpyy/kTKdVS4XCktGpb72TySKtkE=; b=g9SepQcuYt3bw9
	1t8nD+YWLHvOvZq9pabWOuFGHBIfA0bLr0lkKsWk5H0yrLQ9rAPoBhJuH//RohVg/08JkW5+CCeLw
	ggV3IMyil3IJo9Ai51gk+XpvcgfuqiX4wPLsgjhDLA1/fFrrFHU71gVGuSTeOnbCP8705ugUCy0gW
	4ko60VZNBXLnc+t/iLR0Hi8NqE1PL0SdsfqOez9xbKFLx+LlioHpf6dp1NhEx8vn4N5u25gDNn1SY
	gPaUxD/83SpVZ+WlzsmUPhObnYCbIoXfIqtUnT9zkieUOM5rO1QpIChxLd8oV3ueu6hOtKGdQqY9y
	BtLPgrIVAasB5yUIiAtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngnRs-003fXG-KG; Tue, 19 Apr 2022 12:59:16 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngmLa-003FS7-La
 for linux-mediatek@lists.infradead.org; Tue, 19 Apr 2022 11:48:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 62AFEB81808
 for <linux-mediatek@lists.infradead.org>; Tue, 19 Apr 2022 11:48:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AAAAC385A5
 for <linux-mediatek@lists.infradead.org>; Tue, 19 Apr 2022 11:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650368919;
 bh=JCgMiwyD52Mfee1pO8eoHv8GHzhEnFXjizjVzOtSsxA=;
 h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
 b=TqINAChhZ7wi6fBGA+9pDD8w2vbni+85039Pnd3TxFjZSu1q30q+guJ0MT3hIcwZ2
 pcPguPhrO6WmkL024XmA8T/+SU4yT2aOKVlZtW+/NVucZdezx2waHofWKCNi/Dh1aH
 ZnPSGGwKNqyVLFGJJq7fE+fQbuD352g8EMafw+IpRsspSWqolLk1RUzQ3rVj7kF2Xd
 CYHmI0l/+2X8+y8iWQNMAc3+skJdsrPIhcLCfPgJrLsRdGlOPnohGOUZMzyU7sMZgd
 DofSxA/OpPw/CH4jPd26C8C/S42fPoBFuguy5Knpvz0ltC3dVM7XNMC/FGPoWxPudK
 uqwFJpKX6wSiQ==
Received: by mail-io1-f53.google.com with SMTP id p21so17264841ioj.4
 for <linux-mediatek@lists.infradead.org>; Tue, 19 Apr 2022 04:48:39 -0700 (PDT)
X-Gm-Message-State: AOAM533Pacc9/DE42dDUwZ7lLBok0cf5XRo7fLNTTYDYX9Lgg4pb+05R
 u1o9inoM00lhGRo4dPrTS5gh1ruwqCGtdojNFZ0=
X-Google-Smtp-Source: ABdhPJzuYOxUEZRVrD/jtl+UDqJFtOunqtwPeJ91XckRk2H4XnuZJUi8XlLNq9Ql3EoVGm6A8oyVg3Uz5km3drehUYU=
X-Received: by 2002:a05:6602:15c6:b0:611:591d:1d9a with SMTP id
 f6-20020a05660215c600b00611591d1d9amr6332958iow.177.1650368918339; Tue, 19
 Apr 2022 04:48:38 -0700 (PDT)
MIME-Version: 1.0
References: <b6e1b4b7b5f894cf77a60768e445218805fbb681.camel@mediatek.com>
In-Reply-To: <b6e1b4b7b5f894cf77a60768e445218805fbb681.camel@mediatek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 19 Apr 2022 07:48:27 -0400
X-Gmail-Original-Message-ID: <CA+5PVA55rfq0pgGXCHgt0AhyS=yRYU_nLoM3kif7qejVnbJRGw@mail.gmail.com>
Message-ID: <CA+5PVA55rfq0pgGXCHgt0AhyS=yRYU_nLoM3kif7qejVnbJRGw@mail.gmail.com>
Subject: Re: pull request: linux-firmware: Create Mediatek MT8195 SCP firmware
To: Tinghan Shen <tinghan.shen@mediatek.com>
Cc: Linux Firmware <linux-firmware@kernel.org>, 
 linux-mediatek <linux-mediatek@lists.infradead.org>, rongchang@google.com, 
 Yunfei Dong <yunfei.dong@mediatek.com>, Shawn Ku <shawnku@google.com>,
 stevecho@google.com, Project_Global_Chrome_Upstream_Group@mediatek.com, 
 srv_heupstream@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_044842_906104_6B5CF2BB 
X-CRM114-Status: GOOD (  18.14  )
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

On Thu, Apr 14, 2022 at 2:48 AM Tinghan Shen <tinghan.shen@mediatek.com> wrote:
>
> Hi,
>
> Add new SCP firmware for MediaTek MT8195.
> Thank you!
>
>
> Regards,
> TingHan
>
> ---
> The following changes since commit 8a2d811764e7fcc9e2862549f91487770b70563b:
>
>   rtl_bt: Add firmware and config files for RTL8852C (2022-04-13 07:10:23 -0400)
>
> are available in the Git repository at:
>
>   https://github.com/tinghan-shen/linux_fw_scp v14454.8.0

Pulled and pushed out.

josh

>
> for you to fetch changes up to 10612bd12e4778069aff50caad9431002f92e374:
>
>   mediatek: Add mt8195 SCP firmware (2022-04-14 14:03:33 +0800)
>
> ----------------------------------------------------------------
> Tinghan Shen (1):
>       mediatek: Add mt8195 SCP firmware
>
>  WHENCE                  |   2 ++
>  mediatek/mt8195/scp.img | Bin 0 -> 429668 bytes
>  2 files changed, 2 insertions(+)
>  create mode 100644 mediatek/mt8195/scp.img
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
