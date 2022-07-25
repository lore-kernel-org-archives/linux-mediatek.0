Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF9BFC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jul 2022 18:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DrB3OBw238QfJvsk/V9RCxvF+LWolaFj/h1IiHXV0ZE=; b=HZ5FUlCjNR49dus+/KbLnExs0p
	9Hj1kDIr7ebVQH/HHNi41rRyxYwhtgrqRxP9aveVwvMrgOqx3Dz4BKvlBTDohW5AO1NJ4RqI54ikq
	/fK9MveKfZR8B1RypbYY8ZvNVTa2CWXtzzATgE6hV3zXEoOiKN6OEqfkTpB/O9I1ntm/RIQ/P8Iiy
	UDBTZHwuavNSW3b9g2nY7dbY8W9tE4KYiR6oeYxwBnWj5sqspEBI7mnFil6RRNfA3CO5B8fAjW1aP
	SLdXAo7q8hdGVU2DPaI1cmQbqucRjTIngKniy3h68n+X2+RRj3HBsBX/fF3Ov1F6QwSwV0bYQvbTq
	tZ7C+Kzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oG2ce-00GRgc-Da; Mon, 25 Jul 2022 18:16:04 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oG2cb-00GRf5-9g
	for linux-mediatek@lists.infradead.org; Mon, 25 Jul 2022 18:16:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id B7F10B810A2
	for <linux-mediatek@lists.infradead.org>; Mon, 25 Jul 2022 18:15:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59797C341C6
	for <linux-mediatek@lists.infradead.org>; Mon, 25 Jul 2022 18:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658772958;
	bh=agwYaHzbPK1VDytUTtodWqQ0MWkJCgfOTTaATnI0EHU=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=bKJ/6KXy1/PoqQ34/iVJ2Agab81iYX08r1gfm7lXaTHsXqyHbwX25f39jtNDCpdaZ
	 oPdj/czBnuL2lzxefs3jS20t5gsMRKmLtM16fSjOEjTeKOiVottfwz0VAJVxiLjPE4
	 /1Q/IMq0B61pSS5ambMqWgDESDuaOeWkV6Ogr9AXYyZ/StGQAr0AdhRKtdwdGliH0m
	 ZxmVG9XbteMYgZAPOB4EftFQm69Y1FpAUng2BuT+OY9d4Dl+qihVavu/MdkFtroPQZ
	 3wqlv38qi6iKASGQnQEGz+RoP1loWmUTQZPBnqvva9Cyt7bDF8rNBMFYHTmewDiHet
	 w160U7tnThdBA==
Received: by mail-il1-f180.google.com with SMTP id v2so2733548ilm.4
        for <linux-mediatek@lists.infradead.org>; Mon, 25 Jul 2022 11:15:58 -0700 (PDT)
X-Gm-Message-State: AJIora8U2S9arXdKrJyH02AzI2HudgHuIhWyPYweKz6zDQGUEktgjszO
	qtd7g7iLjMO3/PdL+5EyNYZF8fu7SUzG/hjlUpA=
X-Google-Smtp-Source: AGRyM1utbjTU1C9uhbSuRLSz4HE51dpqipV7dPRpR3rKxUCJvmO4NYWEao1eshc6X5HBgkWJLwRwK539LOnwcgWYbfM=
X-Received: by 2002:a05:6e02:1aa5:b0:2dc:8302:5dc3 with SMTP id
 l5-20020a056e021aa500b002dc83025dc3mr5005700ilv.243.1658772957560; Mon, 25
 Jul 2022 11:15:57 -0700 (PDT)
MIME-Version: 1.0
References: <42437b6fc5dac19bf23f9806dfbe6915e055397b.camel@mediatek.com>
In-Reply-To: <42437b6fc5dac19bf23f9806dfbe6915e055397b.camel@mediatek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 25 Jul 2022 14:15:46 -0400
X-Gmail-Original-Message-ID: <CA+5PVA6uJtrzZZ=k0g6u1ycTm-oXSuuUoddSG8rUebGftnKu5g@mail.gmail.com>
Message-ID: <CA+5PVA6uJtrzZZ=k0g6u1ycTm-oXSuuUoddSG8rUebGftnKu5g@mail.gmail.com>
Subject: Re: pull request: linux-firmware: Update Mediatek MT8183/MT8192/MT8195
 SCP firmware
To: Tinghan Shen <tinghan.shen@mediatek.com>
Cc: Linux Firmware <linux-firmware@kernel.org>, 
	linux-mediatek <linux-mediatek@lists.infradead.org>, Yunfei Dong <yunfei.dong@mediatek.com>, 
	Shawn Ku <shawnku@google.com>, Project_Global_Chrome_Upstream_Group@mediatek.com, 
	Justin.Yeh@mediatek.com, "allen-kh.cheng" <Allen-KH.Cheng@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220725_111601_503408_457345E1 
X-CRM114-Status: GOOD (  16.41  )
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

On Fri, Jul 22, 2022 at 4:29 AM Tinghan Shen <tinghan.shen@mediatek.com> wrote:
>
> Hi maintainers,
>
> Update SCP firmware for MediaTek MT8183/MT8192/MT8195.
> Thank you!
>
>
> Regards,
> TingHan
>
> ---
>
> The following changes since commit 4421586e8e95ce789cb6b3f1af98962bfef74c7b:
>
>   amdgpu: update renoir to release 22.20 (2022-07-19 06:44:08 -0400)
>
> are available in the Git repository at:
>
>   https://github.com/tinghan-shen/linux_fw_scp mtk-scp-20220722
>
> for you to fetch changes up to 56cf6461a82b08facd41154f7c44a19f0a085f66:
>
>   mediatek: Update mt8183/mt8192/mt8195 SCP firmware (2022-07-22 16:16:27 +0800)
>
> ----------------------------------------------------------------
> Tinghan Shen (1):
>       mediatek: Update mt8183/mt8192/mt8195 SCP firmware

Pulled and pushed out.  Thanks.

josh

>
>  WHENCE                  |   6 +++---
>  mediatek/mt8183/scp.img | Bin 1032064 -> 1030776 bytes
>  mediatek/mt8192/scp.img | Bin 327968 -> 328096 bytes
>  mediatek/mt8195/scp.img | Bin 429668 -> 429820 bytes
>  4 files changed, 3 insertions(+), 3 deletions(-)
>

