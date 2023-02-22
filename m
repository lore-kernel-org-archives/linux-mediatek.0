Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBA09C636D6
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Feb 2023 03:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BHFZkmuOI6BBxjehOO7TZF+023IFD6iXS2Qeu1DPdGo=; b=NehCY+1uZchibqPhA9Y1Cb6+I8
	k95OdQsj2oP2wHwpH9IkXMjeQUm+zStVWNe8WV4oHa38topovNf9NuyDFCEL0UsYdfaOpBxr7x+0V
	84IcHpaPoBXy6jUSA1GVDkzpTHqp6DctcahXqKjNV9NNlZ6w1WZFbxWwWZCGNFq7VFoaxsFNp/8Zf
	26WLPORGHSGxppsg9t3osUCd3KvCLqtqr0zDmzDf3uoo2xK8FGJlCHvHAxDPungZfhCskdJByXz6+
	ywdZaSV0nfOdfcoqYa7Jb6md+xJen2WcEZCYmYneKSv1DgQmaG3ydd9Nfmelm+96FByK5drJaYkVw
	cNh+JTTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUfsu-00AcEB-Cz; Wed, 22 Feb 2023 03:33:36 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUfsi-00AcAc-9V; Wed, 22 Feb 2023 03:33:27 +0000
Received: by mail-lj1-x22f.google.com with SMTP id z5so6463795ljc.8;
        Tue, 21 Feb 2023 19:33:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BHFZkmuOI6BBxjehOO7TZF+023IFD6iXS2Qeu1DPdGo=;
        b=BBEgUeGnp+x8jZiqSGBLkg4okUweEOQ507KEEynqmRKEhs+L3RGzD/urFDM6IoduKr
         aYRCnsmCygJhS9iRm762tmUYefxtktzDhpMhAxmf3ufDUyiJoKD5sO4YFzI6xqzu2Fp1
         7zu1LCt1zZ+cLiBnyTXrRi1SutJ2QIsNFr0YyWuejEDTwrfFeyIzA5KAPgeGnThv9ILS
         ubMVlMC6SGdT6GlidnNo/O2syYoqp7cZz/DBQ65Mb1GYWylldnyeTN9RNFDXsrLNia5f
         sk09TuKTfX8q07yx3RDtYTnV6c3bbSDOqxtT6ajB+owjNJ2HbDvgKpFBjmfnDjp8tY6F
         SGAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BHFZkmuOI6BBxjehOO7TZF+023IFD6iXS2Qeu1DPdGo=;
        b=wNaXMtjPqGP54nhGDbFqCK+LyzvkeEdBiVIiCw48dOfgX4pArHlRmovVagJvNIWvJW
         hSFjFrporpAmd8X8lcLyg1tJxAxsLrdaAWmhOPiYyakssxajZ2S4X7h7t8npEtYS+Y+0
         Fn6hSVq+jpc4ddK7qnu/UiUUS7oj541Qy9CulmpL7OO/ARcYxVYar+A5lqX/Zo81OREw
         9QwY3ZtwOiRCmd8GnDdgikp1GPorU/gFc+4XsTSy4+EJSfYqMShG+5EYldZbb7solkf3
         yiS1xmbaHM+Kr4KuWSGSonVX4gC2cOCYIXjtAGQ1WnsHthT92Iyxt+/GU/GCniVdfVm5
         yNaA==
X-Gm-Message-State: AO0yUKV3Pp91C7asnrjwHCQOAkK0NRkaMqKMvo4dKRrep/b8oy14rnmG
	fJIBtEqxkwXkv4bE3gV+l7vcgqhJYipDDa576g==
X-Google-Smtp-Source: AK7set+0L9PPz40Fyy1a4rZ5p7rDYSNtyek52Q67gGpslyDHlhVrpRatkbfM+OW3ZiSQGf6iOf5S+OvWZQt6VdQoNHo=
X-Received: by 2002:a2e:b4a3:0:b0:290:6f84:541 with SMTP id
 q3-20020a2eb4a3000000b002906f840541mr2247736ljm.8.1677036802009; Tue, 21 Feb
 2023 19:33:22 -0800 (PST)
MIME-Version: 1.0
References: <20230222030427.957-1-powen.kao@mediatek.com> <20230222030427.957-6-powen.kao@mediatek.com>
In-Reply-To: <20230222030427.957-6-powen.kao@mediatek.com>
From: Stanley Chu <chu.stanley@gmail.com>
Date: Wed, 22 Feb 2023 11:33:10 +0800
Message-ID: <CAGaU9a-8f6FcnOAnJMJhawR_ijGtc_r71eYzyqyq-PrYuvi86A@mail.gmail.com>
Subject: Re: [PATCH v2 5/7] scsi: ufs: core: Remove redundant check
To: Po-Wen Kao <powen.kao@mediatek.com>
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>, 
	Bart Van Assche <bvanassche@acm.org>, "James E.J. Bottomley" <jejb@linux.ibm.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	wsd_upstream@mediatek.com, peter.wang@mediatek.com, stanley.chu@mediatek.com, 
	alice.chao@mediatek.com, naomi.chu@mediatek.com, chun-hung.wu@mediatek.com, 
	cc.chou@mediatek.com, eddie.huang@mediatek.com, mason.zhang@mediatek.com, 
	chaotian.jing@mediatek.com, jiajie.hao@mediatek.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230221_193324_366544_879CC0B0 
X-CRM114-Status: UNSURE (   7.43  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Feb 22, 2023 at 11:05 AM Po-Wen Kao <powen.kao@mediatek.com> wrote:
>
> is_mcq_supported() already check on use_mcq_mode.
>
> Signed-off-by: Po-Wen Kao <powen.kao@mediatek.com>

Reviewed-by: Stanley Chu <stanley.chu@mediatek.com>

