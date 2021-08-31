Return-Path: <SRS0=bg5C=NW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7111FC4320A
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Aug 2021 02:47:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2FE3161039
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Aug 2021 02:47:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2FE3161039
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=acm.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=seEmYwJBVuIuASK3O4GZja0SPdQSprHDjaFTtLbViVg=; b=kxSvjyKTDLbwpI
	pBEGfel2IJTgtTdHP3/b+N75aWK/fsFQERnKJb3hcaRqqwmW+kLhtOJf5tmV1ad5GBCQ7y91XVBQ7
	wwlHUkSPXRp0uCpRbLKtQvphYfBkd5RFIN9h9K+0QPE58wsP1MPpgZLXx2sz6MGbsvPJo1+Yf7irm
	zEgYAkz+YoR05nUf5mkgFuEMOeVfEpmwu6RL0BmzOO0ZT1oQwRiHQLHbX++WbJ9CNWZ4OoPVNPUI2
	U60hyrN0jEO6TNGXijaHqlsD86EqDZXCzebUUmqTcOtv+29mjqT/TxWz7wGCeCSA8fDYATa+VP4BL
	lBFNh/6OIZGaAAzsN2XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mKtoN-0011OC-PO; Tue, 31 Aug 2021 02:47:43 +0000
Received: from mail-pl1-f182.google.com ([209.85.214.182])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mKtoK-0011Nf-O7
 for linux-mediatek@lists.infradead.org; Tue, 31 Aug 2021 02:47:42 +0000
Received: by mail-pl1-f182.google.com with SMTP id u1so5931543plq.5
 for <linux-mediatek@lists.infradead.org>; Mon, 30 Aug 2021 19:47:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3fg13iXsKn4rqDa733c2qnMua3+XBlp2C+4HCh2lEFU=;
 b=dr3q1/4JdMgAtF1IGhRONuNWgCqn0FTdgP2UzSy1aTCTY8MOxIpByAnE0LNyiXpB+b
 K4mTSqujB/H0yo9y9i57mnCvvp9IzPo3X0i2CKZnsWNFWztftE7dgQ7gnXtttfHbTXPK
 mrkgUblz3ZYYqAhPn2Zn0YEucwFdNfxeB3iAJP8dnMZJKWj5/9VVkFasPnuvoD1yE1sE
 5N6ZUrFNcyurnPcvZMejAsCBbajyqPUPWuff6EC9mRVHexDaO2YR5bHjCJKU4Xsc7NRP
 wRRJZn+vqGeywv9fIG5srLfedaHyltA1g5QCyIpKZNGmIBiJgMcxV3tLr3wMpIC9JlzY
 n5Kw==
X-Gm-Message-State: AOAM530kVobjbvC0ltGRDOAjXKceig0QF/9uaDFMuTbDQyGc7+FGETbx
 KZLnmnWWFAvwKeFosg/NK4M=
X-Google-Smtp-Source: ABdhPJydeiE+yRYPqtoxh5/wunq8epbATPfbfzIL8F9MF3FdZVNTD5RNLWADgGC32kZA5POCn+E//g==
X-Received: by 2002:a17:902:690a:b0:12d:86cf:d981 with SMTP id
 j10-20020a170902690a00b0012d86cfd981mr2463466plk.39.1630378058879; 
 Mon, 30 Aug 2021 19:47:38 -0700 (PDT)
Received: from ?IPV6:2601:647:4000:d7:7088:a165:5c26:c716?
 ([2601:647:4000:d7:7088:a165:5c26:c716])
 by smtp.gmail.com with UTF8SMTPSA id p9sm5921179pfq.15.2021.08.30.19.47.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Aug 2021 19:47:38 -0700 (PDT)
Message-ID: <dda8eb67-fe56-8bc0-5ce8-a62bd4e6b995@acm.org>
Date: Mon, 30 Aug 2021 19:47:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.0.1
Subject: Re: [PATCH v1] scsi: ufs: ufs-mediatek: Change dbg select by check hw
 version
Content-Language: en-US
To: peter.wang@mediatek.com, stanley.chu@mediatek.com,
 linux-scsi@vger.kernel.org, martin.petersen@oracle.com, avri.altman@wdc.com,
 alim.akhtar@samsung.com, jejb@linux.ibm.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com, powen.kao@mediatek.com,
 jonathan.hsu@mediatek.com, qilin.tan@mediatek.com, lin.gui@mediatek.com
References: <1630325486-11741-1-git-send-email-peter.wang@mediatek.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <1630325486-11741-1-git-send-email-peter.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210830_194740_837811_28A0F90D 
X-CRM114-Status: UNSURE (   9.69  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 8/30/21 05:11, peter.wang@mediatek.com wrote:
> +static void ufs_mtk_dbg_sel(struct ufs_hba *hba)
> +{
> +	static u32 hw_ver;
> +
> +	if (!hw_ver)
> +		hw_ver = ufshcd_readl(hba, REG_UFS_MTK_HW_VER);
> +
> +	if (((hw_ver >> 16) & 0xFF) >= 0x36) {
> +		ufshcd_writel(hba, 0x820820, REG_UFS_DEBUG_SEL);
> +		ufshcd_writel(hba, 0x0, REG_UFS_DEBUG_SEL_B0);
> +		ufshcd_writel(hba, 0x55555555, REG_UFS_DEBUG_SEL_B1);
> +		ufshcd_writel(hba, 0xaaaaaaaa, REG_UFS_DEBUG_SEL_B2);
> +		ufshcd_writel(hba, 0xffffffff, REG_UFS_DEBUG_SEL_B3);
> +	} else {
> +		ufshcd_writel(hba, 0x20, REG_UFS_DEBUG_SEL);
> +	}
> +}

Can ufs_mtk_dbg_sel() be called from multiple threads at the same time? 
Does the 'hw_ver' variable need to be protected against concurrent writes?

Thanks,

Bart.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
