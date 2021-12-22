Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 469B9C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Dec 2021 06:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kWAc4X+KjhWO9qkKYoa61YQ3Utk3rNJc110BEzMq2hg=; b=3WhN/9h2uJgQ5x
	ygkU8SefkKho3ItWWZyvSl3968BmxhUKVYjP5Y42TXbsF2nPqsIPTKGocHKRjCaEFsgxe/nboFm8X
	PZCJjgimrPl6s3qn9vN8y051lNZbGym9UD0uEoo2229f2fkQbcue05TxciHk6tNnYVh/BHaeRRI6v
	ulLyNf2SawmbYyhJIfd7V0RfvqYa5WlX0afkRRq/pI0WSZQ416w4wMwpHaCxKQCqTF6MvmLz2440a
	V4lwCoKeM48njW367JlNiKXvWyFKsu4lGY3/qmTEmIePqQ4hKASH3Ff3+cVhKRJmOFLLY/W2NsSv3
	J0gNdW6F1PV2rJp1oHQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzvQj-009N8A-OA; Wed, 22 Dec 2021 06:48:53 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzvQX-009N56-QP
 for linux-mediatek@lists.infradead.org; Wed, 22 Dec 2021 06:48:44 +0000
Received: by mail-lj1-x233.google.com with SMTP id p8so2193502ljo.5
 for <linux-mediatek@lists.infradead.org>; Tue, 21 Dec 2021 22:48:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NSkDFoSerZVrmpLUilEfV8Ju2E4v5m7ZKobzRBew9sw=;
 b=mEC1KfAwMvoAoyjVKDIGpaOLh80+Y/8/xezFZ1BLp994C5sEoKe3q3md8D4fzDyDbk
 FloATRehA0zl19Me9KCKvGjRSoAM9nD2q5Y9g8wdVB20G7bMA2NlXZNjYSbnpj96VGts
 DKRPGYXR9DbMka+rF+2fpac9vkLiM3thWRWls=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NSkDFoSerZVrmpLUilEfV8Ju2E4v5m7ZKobzRBew9sw=;
 b=UEmiOMH/wrWWcubZawN3vQRe1a5KL4rPdvTLoviu5sQON1H7lHz/ATh+kiQuB4djhe
 NQ6UWeRCyZuqu7BR7KaXevjuZbvtwpMfJOyAsqUbOhHzaeRUV0xpEdnkyTzta8bXhmBC
 WvJp4wwBEum0swYYWGtYlN8ep3Fjt7Ykxp7uaLEDSqeRMKuvC5V2vTLw3h9U7wxi3myE
 tCYl1sPVzRhzCOqn17BUYiJ5JExLICRZAPYLVyu+JcGnRt9CHpKUGFt5FdCeLc5Ka3vf
 VrgL7Crqhs5W5KrkLFlrNj/zty39Iz9gdHSZEZxBd5VPv4NLlanc1GqAaiy7qzpkKIm8
 ABhw==
X-Gm-Message-State: AOAM532NLnfq7Sz8EapOYyCOjEUXiq93+zXp5XJCVq0ZZTnqoPCeyiej
 nC3DqguaHnRWNJHFODvJABVS9HqxUnOY2fEXXsT+qrjreUhh1w==
X-Google-Smtp-Source: ABdhPJwYuCHiq0ppLpf4B056P0N88O5bHGRzhgw4jU3lnH8UCjNrBnXr/enwCxheyjFZfYfLP7YvdLpHLB7uLjwdqdE=
X-Received: by 2002:a2e:aa14:: with SMTP id bf20mr1254932ljb.376.1640155719274; 
 Tue, 21 Dec 2021 22:48:39 -0800 (PST)
MIME-Version: 1.0
References: <20211222062444.16144-1-linmq006@gmail.com>
In-Reply-To: <20211222062444.16144-1-linmq006@gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 22 Dec 2021 14:48:28 +0800
Message-ID: <CAGXv+5GF1WOeXVtnknAa4GYXE3Hd-UzcCBCyQzT6KY3tJCrVGA@mail.gmail.com>
Subject: Re: [PATCH] scsi: ufs: ufs-mediatek : Fix NULL vs IS_ERR checking in
 ufs_mtk_init_va09_pwr_ctrl
To: Miaoqian Lin <linmq006@gmail.com>
Cc: Stanley Chu <stanley.chu@mediatek.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Avri Altman <avri.altman@wdc.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 linux-scsi@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211221_224841_901635_763DF900 
X-CRM114-Status: UNSURE (   7.88  )
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

On Wed, Dec 22, 2021 at 2:25 PM Miaoqian Lin <linmq006@gmail.com> wrote:
>
> The function regulator_get() return error pointer,
> use IS_ERR() to check if has error.
>
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>

Please add

Fixes: cf137b3ea49a ("scsi: ufs-mediatek: Support VA09 regulator operations")

so that the patch has a chance to get picked into stable.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
