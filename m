Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6495EC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Apr 2022 11:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vo9eVN0ckbboVIZYAOX1eaO/46BU1ChcHw4VZH4ziBw=; b=bDjKY3dGbBzXHv
	RZ7HHxINMfTvAoVHKNUmUTtyf3q4UpmuH/FkDyv56/bMSgOCQR6qMkpYygh7LpU/miDRCiTrScNlo
	32fyo5bcb3SUeaqwZSIfTQCELy74eDKw1hKbolJfaHBCY1yGXhhDNWFeC6l3zwnGH989B81chEIp3
	JqiextfjANuN5y9cDXpW8YynHATpHP6tDqwYVXa7buyugyzaFNdMncYNLNRaUTP6vEw3MmI4przhy
	x08B4LCd2wyS+MmaWRlL1onPOAjsgjEUIKXO8V0PcMRdfdCwoPU6kD7mFMBq6gQr/3UJvhs8GJ27m
	AN88tISILDANoqL43FYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nds39-008boG-Ax; Mon, 11 Apr 2022 11:17:39 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nds2y-008bmd-44; Mon, 11 Apr 2022 11:17:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C119EB811F0;
 Mon, 11 Apr 2022 11:17:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90A69C385A3;
 Mon, 11 Apr 2022 11:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649675845;
 bh=41EOXuCUlWZ9rfU54chR/Cb1cj4BTjAvEPHrjFip/6k=;
 h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
 b=C+p6yNgEe2G3RzBtvhakwLqb9as7sso0iY7zigdeJY3PIaiVBUPrnh9tuoRgb6OFT
 Zy4H8f1WhkK9BPeUbrhdjic1XWnae1K2fC1WF+J5EgKxjV4MRjT1VkrvLtLM/F5c4d
 jO6+y6XVelIdZroIhbqt1QXIwJ9vRGAhxbwjFjjC/RcvVrtzQbmo2Nd+GxQwFETLhh
 ZiJWseOll2BFNRoyEThOkH/ci4rBGG5M4yJSgkf4k3U2bikY7zZTVHVjZpcC57H4KS
 fmCnbmknPmVBOaolCkr5HHx3q8C7rIjXQuZBTqqPRkR4+CARfUps0FgU/UEi8IlgFx
 gPzjUhxIrLoAQ==
Received: by mail-il1-f174.google.com with SMTP id t4so11134751ilo.12;
 Mon, 11 Apr 2022 04:17:25 -0700 (PDT)
X-Gm-Message-State: AOAM531NaLCwXAoPpg84ysO11EhDqJlbK9melu8HM0vGkP50WATxppLK
 TDKQR0Gw30eWwxLzO3zMZ6Lm4p699Xm0oOj35l0=
X-Google-Smtp-Source: ABdhPJzTtS5Y4xZp0z2ZUJ6t7v+AtxMn3vZjZEG2vSBqrnlOjSoBFaAKzkOZIlzvBZj4Up7QpX5C/EQM87PiWvOojJw=
X-Received: by 2002:a05:6e02:b2a:b0:2ca:703:59d2 with SMTP id
 e10-20020a056e020b2a00b002ca070359d2mr13927415ilu.218.1649675844679; Mon, 11
 Apr 2022 04:17:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220408062722.26813-1-yunfei.dong@mediatek.com>
In-Reply-To: <20220408062722.26813-1-yunfei.dong@mediatek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 11 Apr 2022 07:17:14 -0400
X-Gmail-Original-Message-ID: <CA+5PVA5h0NsA5P+AUWrOOQ4gqu6oMqtDUf2HO=rV30iCyiiHTw@mail.gmail.com>
Message-ID: <CA+5PVA5h0NsA5P+AUWrOOQ4gqu6oMqtDUf2HO=rV30iCyiiHTw@mail.gmail.com>
Subject: Re: pull request: linux-firmware: Create Mediatek MT8192 SCP firmware
To: Yunfei Dong <yunfei.dong@mediatek.com>
Cc: Linux Firmware <linux-firmware@kernel.org>, 
 linux-mediatek <linux-mediatek@lists.infradead.org>,
 linux-arm-kernel@lists.infradead.org, 
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 tinghan.shen@mediatek.com, 
 Irui Wang <irui.wang@mediatek.com>, srv_heupstream@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_041728_352881_75269734 
X-CRM114-Status: GOOD (  17.71  )
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

On Fri, Apr 8, 2022 at 2:27 AM Yunfei Dong <yunfei.dong@mediatek.com> wrote:
>
> The following changes since commit 681281e49fb6778831370e5d94e6e1d97f0752d6:
>
>   amdgpu: update PSP 13.0.8 firmware (2022-03-18 07:35:54 -0400)
>
> are available in the Git repository at:
>
>   https://github.com/yunfeidongmediatek/linux_fw_scp_8192 v1
>
> for you to fetch changes up to 3ac2fc85bc7dfcebdb92b5b5808b0268cdfb772d:
>
>   mediatek: Add mt8192 SCP firmware (2022-04-08 10:59:44 +0800)
>
> ----------------------------------------------------------------
> Yunfei Dong (1):
>       mediatek: Add mt8192 SCP firmware
>
>  mediatek/mt8192/scp.img | Bin 0 -> 309436 bytes
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  create mode 100644 mediatek/mt8192/scp.img

This needs an entry added to the WHENCE file

[jwboyer@vader linux-firmware]$ ./check_whence.py
E: mediatek/mt8192/scp.img not listed in WHENCE

Can you fix this and let me know when it's ready to pull?

josh

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
