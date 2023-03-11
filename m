Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2B84C6FA99
	for <linux-mediatek@archiver.kernel.org>; Sat, 11 Mar 2023 02:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JFMM/LW85+BkmtqLGtTq7h5t/zGOgNTjSKHsZWTz0ks=; b=HPbcaLY8YLE/YkLstEEW0KVexv
	s+4cPWIRd5ZMqHsqJV+gpaSjrxHnTmGZqbouGkAooWI5ZCvt0TjW6s8nCWAzSUuvmozfokTB6dotk
	UwMo1ZHm1btNZ665YXcIGClEM8fo2pVEPeaLHoTgeUI03nhrXVjULfjV/H7KZ7WCn74cRnObiHjL9
	+7NNuyOSl+/tU+vt+fp9CoR6gxVUP+PhrhaQkJ+HQDNkroUMeP14n1sBnseakyg9PJivvlsouOO5c
	VIHyd39AXRE+WssfUHMiJbORQ7W44AWFjrFpwPwaFBDoc/AcJw2Zi6QRxnSqQuZ0g5HAbCf89d/F+
	/2aPQlDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paocT-00GwYd-Uk; Sat, 11 Mar 2023 02:06:01 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paocK-00GwVS-5g; Sat, 11 Mar 2023 02:05:53 +0000
Received: by mail-lf1-x133.google.com with SMTP id k14so9006691lfj.7;
        Fri, 10 Mar 2023 18:05:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678500347;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JFMM/LW85+BkmtqLGtTq7h5t/zGOgNTjSKHsZWTz0ks=;
        b=Bd/+0fto6WSHdEzDcuwWFsiVdUjzT1t4KSbBXI4q6x09sK0ONCUG0g4800pnmlPKWx
         HNd0aCeoGFE9R6HrD5X/7KNzBupSaBCJWTYYHpAeyo6KSeM8JJHe1/9gHM4W+2vAQxg6
         NbR9mi+myDFeGdDQWhQGmC0VJc0Rpx5ictYCkjqgz5TDQ7ZmhPHIVa2ohrv+yvREijT+
         OxnLVq/8yKaMufdBizA84T5pshIDzgubAqLSRHe+B5BCgs2w1D31V33uHSxiH+P+7oBh
         BYwySXTW2pnjkFxNdDPhG/rkEYuyRxBHZdUzgbea8nfZLlHeSj1YW0gecXkdWtQPBMch
         7PVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678500347;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JFMM/LW85+BkmtqLGtTq7h5t/zGOgNTjSKHsZWTz0ks=;
        b=SbPTp/JtqUyPgW8bC2c9XD8pf1f2+dFVdLzNA20ajHm/DX9OwOI9gddKJQr6kTG3Zo
         7nPW0t3zQEqNMXXH8bfiutVX7lCo8x6cTF5DBlrvsCKxJpMP4E76WRo86PFPjZEO+hE5
         7icuJdxcJ3kF2kmfjwMzgwfsCwamARW4ooqjM93944NkeyqSbaRIi3e9t3joN4Z+pohM
         f4d8bszyXZDb5Q3guz9PsMAH8K/nULfyxlIPGLLRkrVB9KV1b0lTEyHSA1RTpo4ScHUE
         pljIyhgjKgl8e4B/cdjRQaiJg5fZocSemATKr0EWtYqLF87OiUadVpQrXXuHqadCTu2t
         rd2Q==
X-Gm-Message-State: AO0yUKWYmxZ9goPsKlaVP4E4gYfPb3w3jblBM/h4oPer7csQApLmtsGT
	xrr9yijvBbm3bJWZzYLX81QNPe/w7BBIiTTdlA==
X-Google-Smtp-Source: AK7set+lQcIx9X3YBDKKn3Bwz3OktR/0HzADRDx80+zlEgH3rVxeKKai9VN2RdVnOt2ZBcD1lWiW6A6CyQPq32uOFo8=
X-Received: by 2002:ac2:44b4:0:b0:4d5:ca43:703d with SMTP id
 c20-20020ac244b4000000b004d5ca43703dmr8437303lfm.0.1678500346671; Fri, 10 Mar
 2023 18:05:46 -0800 (PST)
MIME-Version: 1.0
References: <20230307065448.15279-1-powen.kao@mediatek.com> <20230307065448.15279-6-powen.kao@mediatek.com>
In-Reply-To: <20230307065448.15279-6-powen.kao@mediatek.com>
From: Stanley Chu <chu.stanley@gmail.com>
Date: Sat, 11 Mar 2023 10:05:35 +0800
Message-ID: <CAGaU9a92W5a_z_0cg=-BD_dAzzcN_SrpyN+MzN7xXefmeb-D8w@mail.gmail.com>
Subject: Re: [PATCH v4 5/5] scsi: ufs: ufs-mediatek: Add MCQ support for MTK platform
To: Po-Wen Kao <powen.kao@mediatek.com>
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Stanley Chu <stanley.chu@mediatek.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	wsd_upstream@mediatek.com, peter.wang@mediatek.com, alice.chao@mediatek.com, 
	naomi.chu@mediatek.com, chun-hung.wu@mediatek.com, cc.chou@mediatek.com, 
	eddie.huang@mediatek.com, mason.zhang@mediatek.com, 
	chaotian.jing@mediatek.com, jiajie.hao@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230310_180552_252786_2A13B52E 
X-CRM114-Status: UNSURE (   9.60  )
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

On Tue, Mar 7, 2023 at 2:57=E2=80=AFPM Po-Wen Kao <powen.kao@mediatek.com> =
wrote:
>
> Changes
> - Implement vops and setup irq
> - Fix pm flow under mcq mode
>
> Signed-off-by: Po-Wen Kao <powen.kao@mediatek.com>
> ---
>  drivers/ufs/host/ufs-mediatek.c | 192 +++++++++++++++++++++++++++++++-
>  drivers/ufs/host/ufs-mediatek.h |  33 ++++++
>  2 files changed, 223 insertions(+), 2 deletions(-)
>

Reviewed-by: Stanley Chu <stanley.chu@mediatek.com>

