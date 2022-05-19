Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FEC8C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 May 2022 15:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6A9VAzDsx/oCaJOdShsAdqfalTr//16Bp3GASO9dDD8=; b=aacBtbZ1P771Eh
	C8HCAx9HC2RLXDM9PYu0+D5+x1msIatu5wkuOCfVqRMO9tgHGo3ncWBcy1psCjLPVvlX92GYEAxGg
	fkGvl4/rmIoAZYHpvSc0C47I9wOa4uQJx3BnBS/NdYgv2r5oGKg7rgZFIBdV6eXtQ93TIyvhAHLbm
	Thhtwp+k5FCHryihT/GTGgw36AC1hOlvDDyF+dH/gzpG7qDX5O27SNE+2NjQAmy71X7A8roA51yO/
	ZPmoI43DGPXwzBII9DxhSQ0jHD+tX26/5pUeFmLvOftICOQTiuNEcjxTvlHlN+vMmrhyxw3u9E5sX
	LPpKD+KaRlREOQ65Ag5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nriVr-008FZJ-P3; Thu, 19 May 2022 15:56:31 +0000
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nriQQ-008A0c-0X
 for linux-mediatek@lists.infradead.org; Thu, 19 May 2022 15:50:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1652975454; x=1684511454;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=VcoL5apGOXcnE01xUyfbtZsy4dcNNKNxkr9YNCjFz7M=;
 b=V7ZRasAGQd/G9DrlXOP+QsZd3B0Si1eIZyfbShSRTQ/MRXK27IwY9c9h
 xVijZKQcYPsCiM6hFkHCENdtDdA0cFJHIvXu9ualXSbDSpDUwEk61VoKF
 2brKtaz479LMeRLa2bP2ci4NN1614WA/MMMJvnUBJUZBGKZ1InMCJt56o s=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 19 May 2022 08:50:50 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2022 08:50:49 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 19 May 2022 08:50:49 -0700
Received: from [10.110.66.23] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 19 May
 2022 08:50:47 -0700
Message-ID: <36c36cfb-7b0b-db32-2ef3-fddeef10d729@quicinc.com>
Date: Thu, 19 May 2022 08:50:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 1/3] mt76: add 6G band support in mt76_sar_freq_ranges
Content-Language: en-US
To: Deren Wu <Deren.Wu@mediatek.com>, Felix Fietkau <nbd@nbd.name>, "Lorenzo
 Bianconi" <lorenzo.bianconi@redhat.com>
CC: Sean Wang <sean.wang@mediatek.com>, Soul Huang <Soul.Huang@mediatek.com>, 
 YN Chen <YN.Chen@mediatek.com>, Leon Yen <Leon.Yen@mediatek.com>, "Eric-SY
 Chang" <Eric-SY.Chang@mediatek.com>, KM Lin <km.lin@mediatek.com>,
 Robin Chiu
 <robin.chiu@mediatek.com>, CH Yeh <ch.yeh@mediatek.com>, Posh Sun
 <posh.sun@mediatek.com>, Eric Liang <Eric.Liang@mediatek.com>, Stella Chang
 <Stella.Chang@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>, "Ryder
 Lee" <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
 linux-wireless <linux-wireless@vger.kernel.org>, linux-mediatek
 <linux-mediatek@lists.infradead.org>
References: <cover.1652941276.git.deren.wu@mediatek.com>
 <4be64135fe9925fa052d63edf8c253e3586a2e2f.1652941276.git.deren.wu@mediatek.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <4be64135fe9925fa052d63edf8c253e3586a2e2f.1652941276.git.deren.wu@mediatek.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_085054_135947_3419B608 
X-CRM114-Status: UNSURE (   3.10  )
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

suggest you s/6G/6 GHz/ in the patch subject to avoid confusion between 
"gigahertz" and "generation"

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
