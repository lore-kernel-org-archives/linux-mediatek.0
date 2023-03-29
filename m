Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D24DC76196
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Mar 2023 01:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J2ZBooKTdQvtfMVgnhuwabyGyb9Yl38IXe8xsUOWjvo=; b=cj+m6I92z1iAyYd9JNG+Oz1rdn
	2Cc1E0aPFWVHuEA1t+yAWDdiygivM0cPhXYLfhKTKVl5m0dXKxdMbjZ9UkxBpaoFgD9zlxuyZHMWT
	Ut95WxA5+xHT7ydtqY4VM9TiKubLMnXig+hROXVqHZwHq+J+TIbHnhwzEhh9KXi/bHhmtA32bu/AJ
	0gKT7eXc8Ihvhut/jbevRrk1CuTTs6bA45TCbTZoHLWAcVZUfHvRqn9trhE9cl8xHEXU5lRqy/E6C
	BScgWIZDY84uds9tZgC+oaU33Cn1Ep67jx70neb2wwukpitYfMCEDigw0oeVSagoK9/MomztF9LV7
	rYuuMG8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phKcz-00GGug-01;
	Wed, 29 Mar 2023 01:29:29 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phKcu-00GGsn-3D;
	Wed, 29 Mar 2023 01:29:26 +0000
Received: by mail-lf1-x12f.google.com with SMTP id bi9so18148867lfb.12;
        Tue, 28 Mar 2023 18:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680053360;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J2ZBooKTdQvtfMVgnhuwabyGyb9Yl38IXe8xsUOWjvo=;
        b=d4fhJHyxuZd/FESgSXv9Frj/cenBy44pnYyeOw6RdevGJ5hGaZW/JaUKicQuOjfQOE
         lCFsXByYHdquLzahDpeA9QnmeJRC/76MAFuAQBWNxTkCto6ZEbFMlFaTXVgxVwCLvJdr
         vI0Ew3Yq1RMj9N4S9cwC8mTDEFH0zAEZCs1SLQBKU9qjVSCR1jTJhsatv1aViAD00iVo
         5YXTcgKAzr9Kcd6PIErZ9uEOVZDoIbNeOJM0b2DPfQ+y/r384xf9aCRghXNbB+zEh20p
         iQIQDm99H0+EKSe+VgCyRu49TSaD23kIXzf1smy0JdsLYMj4ED/HwuUZvcoUApeH1UJl
         GxYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680053360;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J2ZBooKTdQvtfMVgnhuwabyGyb9Yl38IXe8xsUOWjvo=;
        b=V04aTr3MOBfLzhD+vTR2RKIQ+QkuXbvu106qWSsJBDrZtwjShxZtt7Q7jKzGlxS0zb
         +rShTYJIgYg9H2m0+28/nmcRfsTRDsSLMAp2se1hmA51sbcs0EmLc057bpjuKo9Yvv4y
         C4KD/cXY/kg7ry6Hgh4htT+JD4Z7P9byl27Kf0k6s7kk0fAYzxIOHKaszOfnKgGVFdxD
         B/4wt2hyYG379zOVSVLQNFdMlCD0vADMxha6AcGQoQfVMsgdMVkkXrR5Ua+8qX5I8DsF
         0IZEV1yDjjEEPy95sEtBU+lVEZcOQPUdI3/zij/8Bu9/D29rvAcYnybQaWmZhg2HZblj
         dlRg==
X-Gm-Message-State: AAQBX9foHWJfvMJf8dGNmLBZh+ES76rbA1mu50A04rYwGUOfkbUNm+6M
	6fHR7G1NEE24F8oPA9SbqnfY/MIRs2MBynwtTA==
X-Google-Smtp-Source: AKy350ZzQ6gSicsuEON4vupXM9weznZXLCWciRrzvubMbpNb8S+dfZUJ6rBtuCKYkjhWaPvZQDMOOlwbKf0pYa1EDys=
X-Received: by 2002:ac2:5322:0:b0:4eb:93a:41f0 with SMTP id
 f2-20020ac25322000000b004eb093a41f0mr3975535lfh.4.1680053359417; Tue, 28 Mar
 2023 18:29:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230328103000.10757-1-powen.kao@mediatek.com>
In-Reply-To: <20230328103000.10757-1-powen.kao@mediatek.com>
From: Stanley Chu <chu.stanley@gmail.com>
Date: Wed, 29 Mar 2023 09:29:07 +0800
Message-ID: <CAGaU9a8DyCrUWxYRC=SZ0Qv95qXZPr-dBZGhGfp3xNxB=V4eSA@mail.gmail.com>
Subject: Re: [PATCH] scsi: ufs: core: Make UFS_MCQ_NUM_DEV_CMD_QUEUES a module parameter
To: Po-Wen Kao <powen.kao@mediatek.com>
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>, 
	Bart Van Assche <bvanassche@acm.org>, "James E.J. Bottomley" <jejb@linux.ibm.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, wsd_upstream@mediatek.com, 
	peter.wang@mediatek.com, stanley.chu@mediatek.com, alice.chao@mediatek.com, 
	naomi.chu@mediatek.com, chun-hung.wu@mediatek.com, cc.chou@mediatek.com, 
	eddie.huang@mediatek.com, mason.zhang@mediatek.com, 
	chaotian.jing@mediatek.com, jiajie.hao@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230328_182925_058684_E93A7282 
X-CRM114-Status: GOOD (  10.46  )
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

Hi, Powen,

On Tue, Mar 28, 2023 at 6:38=E2=80=AFPM Po-Wen Kao <powen.kao@mediatek.com>=
 wrote:
>
> A dedicated queue for dev commands is not mandatory, hence let
> UFS_MCQ_NUM_DEV_CMD_QUEUES become module parameter `dev_cmd_queues`
> to allow sharing first hw queue for dev commands.
>
> Signed-off-by: Po-Wen Kao <powen.kao@mediatek.com>
> ---
>  drivers/ufs/core/ufs-mcq.c     | 35 +++++++++++++++++++++++++++-------
>  drivers/ufs/core/ufshcd-priv.h |  2 +-
>  drivers/ufs/core/ufshcd.c      |  2 +-
>  3 files changed, 30 insertions(+), 9 deletions(-)

Reviewed-by: Stanley Chu <stanley.chu@mediatek.com>

