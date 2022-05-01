Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53845C433F5
	for <linux-mediatek@archiver.kernel.org>; Sun,  1 May 2022 05:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hzbsg/ZQyjRtkqCZLF5wLn+J68+X924gWqrXfQdGANQ=; b=RUpNWyb5ftPgSF
	SmKLeugJykRZ3ey12KP2rbKjZnbnnUcBr2WJxjT5Zr0a36hTEsdaPx8iX1DrmYwGxpxtPM/V3jsAX
	5EC/JTxz1xz2TonhTO7SQhP/9Da5j30NIh6jTqbMJVXhCjZ8TpL7DKJ+cALS9TqiL7b/QRf0RngY7
	/Y8DUVGm1lkQrzHNeSoKYPTL+5KFQeOtTY1iZb6otrEreeIv/ttbdfWxBbfAppX06sTwCsz2jMuIk
	uruOIeqxqS4R/2g56G9Z84+jJdEO6lU3dCWZ9wqbV6PGGX8kbq44XpaancJo7AQoeoaSHqFCE5cMR
	iF5cLdJmn32TxTbLJSJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nl1jD-00FZAC-9m; Sun, 01 May 2022 05:02:39 +0000
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nl1j0-00FZ89-Nu; Sun, 01 May 2022 05:02:27 +0000
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-e2442907a1so11772880fac.8; 
 Sat, 30 Apr 2022 22:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0aKCZgVZHwh4Tv70zY74+bpoUv5Mj7mL2pJZ6Uamnh0=;
 b=Ln32ZkW57DHk3aYeYYGzHho7w7JQd5orJTF5/OJ7Q3YlblYmhE67Hvg/CZnF1R54l6
 fKTSg5LO2nFbIE/JhjzNWLZsGUQFiTU5IDe5snREQYmJiU0BRRjbEOtYmXggrLCwMBpn
 cpQTPJPhseMBEFKoZjGFEsdw3sHBvYzmY1q6Vv2VT8aVXbvl9123tIoSXdGuZruI7KbK
 H63Qbk9J3cfS/9s/wxU4Z06WY6FnZXQxx7RxDAVm5UwBib1jl8Yi11aBMfBmYJBqAqnL
 L9zZO6om03JYIK4Rt9Sujy65oQzcn8b2U/O2aoqed94XIOwMusr2Gx/HIJUipGkHeYa4
 xHJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0aKCZgVZHwh4Tv70zY74+bpoUv5Mj7mL2pJZ6Uamnh0=;
 b=Sk4tAhL0NTnAN0MijWcwaZs+xlU9n6FuBlTA6XP5BoDLnpjYv03sTJKK6n11Gd39+5
 ix4nKehyn2OAfYg89D5UirOYvrA8tFamXrT/JrFtVuAnqXc49um8m4nv/KY2exzFo61+
 nErh6Tj6ZEHTeKm9xZ2aGELtganjPgOqtr2JFIbNwc65c+EFSA0NVtdzJ/KsBqoCheNd
 PKaFpZyQ5oWtmZ2y5CnGHm8lP/Sm0Y9w6XHLhQnl091TRWorAEabyoMUzFGFksXo/Zny
 2dBk1m0VfInqaVVfn69/6aB+hZEp8oax/xJnVq8vQfexyW7BG/kdAd02G4yEMrXkUGDt
 qOJg==
X-Gm-Message-State: AOAM5339GGC5U+tkNfm8UeEsvmRhhDfUANn+QHW0mvshugxgmaSmwJ7n
 eVHsSEUqtHgtK6Gi3j5Nuy45DpHMdkPLg/FU8bw+yGyh7Y5wlA==
X-Google-Smtp-Source: ABdhPJxkbSmv7zG4Q6GTSFIGixxeDClKJ/03SoB2VGTC4Uoq/VdDkmPjtpXE3JrrRup2rlDG2eEBsHH5wSkon090EyU=
X-Received: by 2002:a05:6870:c141:b0:e2:9512:de42 with SMTP id
 g1-20020a056870c14100b000e29512de42mr2520243oad.288.1651381345179; Sat, 30
 Apr 2022 22:02:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220430164021.537668-1-gch981213@gmail.com>
In-Reply-To: <20220430164021.537668-1-gch981213@gmail.com>
From: Chuanhong Guo <gch981213@gmail.com>
Date: Sun, 1 May 2022 13:02:13 +0800
Message-ID: <CAJsYDVJ8VFELnWP-OrH9qzQjbrLZKA721+xj_ngjegPE=fAyrA@mail.gmail.com>
Subject: Re: [PATCH] mtd: nand: ecc-mtk: add external ecc engine support
To: linux-mtd@lists.infradead.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220430_220226_814040_02A9B546 
X-CRM114-Status: UNSURE (   7.27  )
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

On Sun, May 1, 2022 at 12:40 AM Chuanhong Guo <gch981213@gmail.com> wrote:
> [...]
>
> +static const u8 ecc_strength_mt7621[] = { 4 };
> +

Oops. This is a leftover line when I tried to split commits.

-- 
Regards,
Chuanhong Guo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
