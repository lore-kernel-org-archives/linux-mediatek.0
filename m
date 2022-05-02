Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B6A0C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 May 2022 09:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J4frx/K0zcocBL40LzYrc4cMMYtQko0sqKl2ce+HBqM=; b=vXpycTpg3T96VS
	H9oucgvEuNuIUrEdWk6/KUUldz0LuLH/S+nDlpI+EKR3W/DiGW9uIUTP2GbJ4Vsx1fjcSY3aQpFIQ
	VlIRfi+dsg4v6/aSVkRtCw7oayUo6s7TQqqOBTYyVZJ0moXrd6hBcPie+M+rgHeHgu/1qaEoU8pY7
	Hw/MVFNqnqBy6Lec6fpX+PK7VVPDx+ggOFbA2703g0SQhZeVPhR0eG0hN3GAj3TeCWkmGBTkKL6rd
	EbBNakPPAMPhRMStL2+4kBO2l986rzosG5EERQUEJpvz3xA/UX5Mg2zFPcetvOAb4JgTFHLEVIj98
	P0/hx+Y+IvAyZ/NXRUag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlSbF-000f9J-1T; Mon, 02 May 2022 09:44:13 +0000
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlSbB-000f8L-RV
 for linux-mediatek@lists.infradead.org; Mon, 02 May 2022 09:44:11 +0000
Received: by mail-oi1-x229.google.com with SMTP id l203so14770502oif.0
 for <linux-mediatek@lists.infradead.org>; Mon, 02 May 2022 02:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Pnp0dZNJNQtkrDucRNkaTQQYBUFrJbIosraQIj5ohy0=;
 b=i3wZpUdR58bPbFpeMankAbhAODtoyJIjIau7booB4ooQTz9g78/2H+UE3xj6giYZMz
 /flR2RT7oYyHwyVl5lcIdrK4IJ0BkWQJC54zLDhRKRbuh3Cxm7MaYj7odONMYrgLaq31
 BKRFhcCT02UTIlj26pHaiDSRbc5ll/ffA7e6gXlo+r0rE9SVhISwyA3OqL3Wx9f2X7vT
 qIs/N4ff1mfMy3nb8dEmgh98zB/+4/zsqq/hA7UROzQFfvkCImvd++RfsSACI+usaMup
 Bjzvt1u0nnRKlA/FfJN0S/41DMAi1D7GKCwHJLlu10FfpSXOB9Nh5/eRIagyfbzQ7fFB
 m2MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Pnp0dZNJNQtkrDucRNkaTQQYBUFrJbIosraQIj5ohy0=;
 b=livy4OgINsiwmfJn7GN8AkcEl4W92wLQrI/scAAzY4V7eCTFtJf2+4NPwT2Tsqi90Y
 B5ZXTpL5CtsL4pBqLm0B/62YKrdZQPnO1YyuzcOuImXp4RLsFHhXf8AQxt9KJ/eSIBcJ
 /uNgWCF0Nfy63knNZK4GaCgazQoqiREY9Ip9rBR3VyxI0ZFdpn68kMuAai28YBQg/2OY
 akTd2SPCawkaSJ+Ou9CDgtzqCXl80UiRHRX9op9VMY9IHk3Lh15Sm/jgONO2/655F0up
 oqApqZ7I9W2VPSQzKGEYia3r5xmjDENbMLYxFlh17qY7dGHDE6889kTQ/9xjwgyMM3yX
 K2/w==
X-Gm-Message-State: AOAM5301i24nKfAqujPiH1KPiKycPYRdYonIdAYSyHIvbbiuej5hTMec
 /dq8WCPPKk96LLcMk5KyjZcuS1N+UI30DsnjLT0=
X-Google-Smtp-Source: ABdhPJxSFc1uAxmWXYwh68l1H/HJH8mEvIn2b8J7aQFWuCZp99cHNrOri7Rr7B6aZOYmuUljw5ZO4gUKAZzb1BEUpN8=
X-Received: by 2002:a54:4f19:0:b0:325:338e:ff52 with SMTP id
 e25-20020a544f19000000b00325338eff52mr6959287oiy.98.1651484648570; Mon, 02
 May 2022 02:44:08 -0700 (PDT)
MIME-Version: 1.0
References: <YmwjUcTKyQNrrn2g@kili>
In-Reply-To: <YmwjUcTKyQNrrn2g@kili>
From: Chuanhong Guo <gch981213@gmail.com>
Date: Mon, 2 May 2022 17:43:56 +0800
Message-ID: <CAJsYDVJN8uZaH-YAk6vBiq845QBdvCkz_Cz9KxZrJ90x8PWqXA@mail.gmail.com>
Subject: Re: [PATCH] spi: mtk-snfi: preserve dma_mapping_error() error codes
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-spi@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 kernel-janitors@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220502_024409_947106_9A952ABD 
X-CRM114-Status: UNSURE (   7.07  )
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

Hi!

On Sat, Apr 30, 2022 at 1:42 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> Return -ENOMEM of there is a dma mapping error.  Do not return success.
>
> Fixes: 764f1b748164 ("spi: add driver for MTK SPI NAND Flash Interface")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Oops. Thanks for fixing that.
Reviewed-by: Chuanhong Guo <gch981213@gmail.com>
--
Regards,
Chuanhong Guo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
