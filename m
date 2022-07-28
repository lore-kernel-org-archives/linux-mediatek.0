Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FD44C04A68
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Jul 2022 21:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DCg7GtaSXROd2kWLXvtaVXu/XbXGSeBpgg9VkrvNnNE=; b=0SOiue0c8xiSyIKv3qwuNRXMsg
	K1puQqqWuNhJ8hivdbdb2NQmaAj4PDG1VP+Umal+747/+twtWUMbwRBJ+F4OZMnCW9GLWNWHXPnBg
	aLiZfzuhEG+9jj13jqRPgYMHdk5vt3wjp3ivYd508sMXQCcI0Rwvuk25EAlOD5y49H2XqJ9r2oUDO
	qUPQdbGQEJR1xGvGv56nnNP+KvlnMNpwh/CUPbsGltSHmFnxQnVISn/SIlnSJrS1SBxKfqSari32h
	8WdM9GA4oHPbNcdVLWGZOGhyCdoOpnMg47IqfmZwR9rE1dSuH8U2S9qdrVy8R10ufoesVNFpq8wCN
	98BUbsuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHBGa-00EhzL-HB; Thu, 28 Jul 2022 21:42:00 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHBGY-00Ehtt-Pi
	for linux-mediatek@lists.infradead.org; Thu, 28 Jul 2022 21:41:59 +0000
Received: by mail-ed1-x536.google.com with SMTP id e15so3760784edj.2
        for <linux-mediatek@lists.infradead.org>; Thu, 28 Jul 2022 14:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=DCg7GtaSXROd2kWLXvtaVXu/XbXGSeBpgg9VkrvNnNE=;
        b=b6m9nDIZZSRG2d7BV+fokw/IEYjz2hmiRQGUs5o4rmX/IPX32M6hu7ihafxYzP0ruW
         xgyyaBQAJy87jCgzACousrmqqFThpkKGdlQjiPDt0OR7hdohlWy/RCFO1cjxcJE4u+M7
         AC+3elsTvx48xUuU6b+U1xDwdrZD7i4Db1hW6ugl6oC+G/QdO9Vpx9oxWo3VmsNzl0Ea
         XT5092253qK8gXvLrqkR9aI0Xo8CyB/tBBb4zBADllCxxCm/L1T3DWR1mkmWs/Ue33Ps
         GjAu9A4dDOO/WQOGoimN4gK3QsFU/JwqLHRQZQ9+ZpozTBJKU4g+PWKDBId6RbSNeCVH
         Fm9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=DCg7GtaSXROd2kWLXvtaVXu/XbXGSeBpgg9VkrvNnNE=;
        b=4v6XI6o4y5ZJtrGPq8C58OwXdo/gHzvbXLQ5Az5/LtPWx8oen3a16C4K8H0Q3tZwsb
         S3PeIdQSCDZuEuc+zab3VCo6OtVmP4Iui3JhzKLeZyyxfPqp0EY9RWEik8bk+rQsk+/g
         8PKpcUfQr6usDEJi0ndlyQSB6G/oNOUaBKwsUWLRn9sOKy3jd+kKOACAvompCv1vIAmV
         66dmQyf2udxwlXKG2EwrhOSKMD3JBctycJ3Dn+syiqVYhVhxa4aKCtdcMzZFhfLiaff7
         Rmz395omjnXruaO/SCIdlnbZmoUo8gba0qJ2+IrlnK3R3rhU9UnAwD8dBgKZF7IhGuJD
         d/Gw==
X-Gm-Message-State: AJIora+zTqrVz7iM6hcIU2xa9BihXLuQUTHGrI/emzZ/0vesWKajH4p+
	M5SfmMAgwnzHWSRebDb2DjU=
X-Google-Smtp-Source: AGRyM1uWKigPK1kK4wjfeeVfkpJx5hKTWn8qmigyXCcCq0xxwAMewuPEYKP8gwjgLe9B5YISj+2p8Q==
X-Received: by 2002:a05:6402:1011:b0:43a:76bf:6c40 with SMTP id c17-20020a056402101100b0043a76bf6c40mr885484edu.352.1659044515478;
        Thu, 28 Jul 2022 14:41:55 -0700 (PDT)
Received: from p200300c5870e1483ac11a16c0f4ae195.dip0.t-ipconnect.de (p200300c5870e1483ac11a16c0f4ae195.dip0.t-ipconnect.de. [2003:c5:870e:1483:ac11:a16c:f4a:e195])
        by smtp.googlemail.com with ESMTPSA id f7-20020a056402068700b0043adc6552d6sm1362159edy.20.2022.07.28.14.41.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jul 2022 14:41:55 -0700 (PDT)
Message-ID: <b9fab29cde42cb9573616092329089f45cd27af2.camel@gmail.com>
Subject: Re: [PATCH v1 1/2] ufs: core: interduce a choice of wb toggle in
 clock scaling
From: Bean Huo <huobean@gmail.com>
To: peter.wang@mediatek.com, stanley.chu@mediatek.com, 
 linux-scsi@vger.kernel.org, martin.petersen@oracle.com,
 avri.altman@wdc.com,  alim.akhtar@samsung.com, jejb@linux.ibm.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org, 
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com, 
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com,
 powen.kao@mediatek.com,  qilin.tan@mediatek.com, lin.gui@mediatek.com
Date: Thu, 28 Jul 2022 23:41:54 +0200
In-Reply-To: <20220728071637.22364-2-peter.wang@mediatek.com>
References: <20220728071637.22364-1-peter.wang@mediatek.com>
	 <20220728071637.22364-2-peter.wang@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220728_144158_874649_5AFE39BD 
X-CRM114-Status: UNSURE (   6.68  )
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


On Thu, 2022-07-28 at 15:16 +0800, peter.wang@mediatek.com wrote:
> From: Peter Wang <peter.wang@mediatek.com>
>=20
> Vendor may wan't disable/enable write booster while clock scaling.
> Introduce a flag UFSHCD_CAP_WB_WITH_CLK_SCALING to decouple WB and
> clock scaling.
>=20
> UFSHCD_CAP_WB_WITH_CLK_SCALING only valid when UFSHCD_CAP_CLK_SCALING
> is set. Just like UFSHCD_CAP_HIBERN8_WITH_CLK_GATING is valid only
> when
> UFSHCD_CAP_CLK_GATING set.
>=20

Hi Peter,

probably "interduce" is a typo in your subject?

Kind regards,
Bean

