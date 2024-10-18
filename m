Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FD20D30016
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Oct 2024 16:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0yLvsGtan4odMmzXY1KXVWoCBMZEVVD5cqw7V/ISgcI=; b=yomNpoMH2sP+S0UgcAktsnEZIv
	2FMWcyZ2/7Tx/6OstKlw6s4N3gy2aBcL6+akDYBy1XvX1z2hpyEDooXBk3gX9i2PX6v7Uuw4lbDuV
	+zNCBm8ch38P5t1xKKC7lqhiHsdn4xeOPiDBLCIu0W5tFCNF3iP2eRu5qZO3ZOqGo8HuJLqn0vZg+
	2tLhS0u6QR1tLW4C+SyTdrIwkewVjHWl2KJNduXV+pYuEj8INxsNI71Etosqq5JqfcrB3bNad+b/4
	f7IBJwyZ0jjmgYa1vSVdLaTR6ZQOPZ1cyWmkMXxiuR2QQ1J9PvGaTrJ9Nu7ECQDxpiQetuwelwXtr
	wkX1fc8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1po3-00000001LwI-3bcF;
	Fri, 18 Oct 2024 16:26:27 +0000
Received: from mx0b-0016f401.pphosted.com ([67.231.156.173])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1po1-00000001Lvc-1VQT;
	Fri, 18 Oct 2024 16:26:26 +0000
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
	by mx0b-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49I9TAXU013017;
	Fri, 18 Oct 2024 09:26:10 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pfpt0220; bh=0yLvsGtan4odMmzXY1KXVWoCB
	MZEVVD5cqw7V/ISgcI=; b=I4ohWXCsSIjRmtvDQUYrIIhmIBaqxVZJ1X6CBvcTz
	kj1GBfW9RlprXk7SZvTH4/p6bk8ym7r7Yb5sgyX6NEHJgbD7yQVw+uXWftFTMEJ0
	i4rNrww4GttR5EqJQvrS4WmcLSi8kvFUN809u96JRwKGjr3qJN8hUKelxzuxQdHD
	wfpUZ82pRpwLXlHEIU3Z03KNtR7j4A5Fd9aPULhiGAsyyzC2WYX7ak8O9qyPVUV6
	PHxhjqLEN//3I074FatO44ikScXuZn5S2jMXQqik8X13lTwasIvjwH5xOyLmbX1A
	fkoelF5x6mvzWM0+xcVz82rUl1/88MPqD2H+asGdbfj9A==
Received: from dc6wp-exch02.marvell.com ([4.21.29.225])
	by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 42bm18h130-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 09:26:09 -0700 (PDT)
Received: from DC6WP-EXCH02.marvell.com (10.76.176.209) by
 DC6WP-EXCH02.marvell.com (10.76.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Fri, 18 Oct 2024 09:26:09 -0700
Received: from maili.marvell.com (10.69.176.80) by DC6WP-EXCH02.marvell.com
 (10.76.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Fri, 18 Oct 2024 09:26:09 -0700
Received: from test-OptiPlex-Tower-Plus-7010 (unknown [10.29.37.157])
	by maili.marvell.com (Postfix) with SMTP id 2FAF33F7068;
	Fri, 18 Oct 2024 09:26:04 -0700 (PDT)
Date: Fri, 18 Oct 2024 21:56:04 +0530
From: Hariprasad Kelam <hkelam@marvell.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>
CC: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
        Mark Lee
	<Mark-MC.Lee@mediatek.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni
	<pabeni@redhat.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>, <netdev@vger.kernel.org>
Subject: Re: [PATCH net-next] net: airoha: Reset BQL stopping the netdevice
Message-ID: <ZxKMHFYr2QJXlxFl@test-OptiPlex-Tower-Plus-7010>
References: <20241017-airoha-en7581-reset-bql-v1-1-08c0c9888de5@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241017-airoha-en7581-reset-bql-v1-1-08c0c9888de5@kernel.org>
X-Proofpoint-GUID: 4-6DMuTv2nkYEwRRsc_Wc3L9qDA2DYaB
X-Proofpoint-ORIG-GUID: 4-6DMuTv2nkYEwRRsc_Wc3L9qDA2DYaB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241018_092625_535251_1D9DE348 
X-CRM114-Status: UNSURE (   8.16  )
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

On 2024-10-17 at 19:31:41, Lorenzo Bianconi (lorenzo@kernel.org) wrote:
> Run airoha_qdma_cleanup_tx_queue() in ndo_stop callback in order to
> unmap pending skbs. Moreover, reset BQL txq state stopping the netdevice,
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
Reviewed-by: Hariprasad Kelam <hkelam@marvell.com>

