Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDD6FC4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Dec 2022 13:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mYuHcMpMgTC0m3iMA8FpqMG9rZZG/4yzIXsxv8BzD4Q=; b=CWoVa2QeRwFn69WsfNDEVHKTp0
	5pK51bt0x0qZGlUXJfe5CruYn8dR4Uy/NTLtcP1OfwJvdM3+cWFQChyOlsucuPfKk29hgd18axHXN
	qEnXAWH9SAjQ9UXT0zQ5QQHBqnoOMQH0SqN6XsVO0XbpMBFurkf72YgZ51q/zytnuAkv6vqF1uWi2
	2vb5ySKiYnvAPXFJrtfevL03q4LARsG1Xgkiky8wLvK4hPCOdtKpfA3T+ss0sOILCxVTmx7o2KfWZ
	HQv6MdjrmKH2n5ztuOV4Eo31Pjvmfy/Uf/8GmAhcMBlA2GAUfz/o1rKisI4BBVTwenM0tQoiIQ5bg
	w10cnupA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p6Az8-00FOVn-IF; Fri, 16 Dec 2022 13:42:46 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p6Ayn-00FOK1-2I; Fri, 16 Dec 2022 13:42:26 +0000
Received: by mail-wr1-x42c.google.com with SMTP id w15so2516904wrl.9;
        Fri, 16 Dec 2022 05:42:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mYuHcMpMgTC0m3iMA8FpqMG9rZZG/4yzIXsxv8BzD4Q=;
        b=EQ1utNUBpT5/gARhtVgdXHHX5dnJdpE0FTA66+x9gIl2AV/cYPh9EpX3/UjPhp9I6L
         3FnOIfRonS3YzBsjsXT4Xf96/zP7RVrpypzlLYFEz5w+sb1VGTa32eHaHuo87sDVT3i+
         k163Amn9PAgGB86owOsajZTI+ja+dadyZXP2qfIeVS5XtTpuECHAiUjTChevkWjp+GzI
         PD57jDZ0phQc9+W5kIp7GmtSdttmURWpYZxHkegAzsNAMmXF1cpGwzuXiaP/3qyh9eHS
         v/gdaD+rUzwgsVpJCRcwHlLNxacKJ4tZGA9Ge6O+n7A49/yOZsY1DlcoNam2xc6kwgfb
         h53Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mYuHcMpMgTC0m3iMA8FpqMG9rZZG/4yzIXsxv8BzD4Q=;
        b=VoJsaitbI+BlBKKZMsfTP6i6Z7XHxI2a8E0meFNYwmUKFfgt8tDWq4fcSRr8IlKnpo
         Ujg24aNcLgIqRcu4NROomKBckIKHMC4S2VrEge/QsczqMIWDDTabNrhk78U924bvnBee
         RfS70fqruxKilD2VuZAJIChkhPRoMNWyA/6MSn/greASh2leSXXSbduKhYCy9EhjPO4r
         5Vo/fBKifZ6wZTcBNTmL8z9UIVXjVMjLP02BnlfafwML7mmon+wrG2ks/9KroHXy4c0h
         tDuOP29JVnLmXYutQqdwYzmYci5q1/vnhMRuV+0UeDh1DSbjhZqQOA/zXrKFUYNANHyQ
         cG0w==
X-Gm-Message-State: ANoB5plx3MW78c0CznYZ2QHwpuwWnhcWGaylBmwhkhVUdOFFGR3I8hMi
	np65r3B+O83bONhsw94hbt7dn8yotvEeyg==
X-Google-Smtp-Source: AA0mqf6ZT7g9UyCovA5LB7Bkyrd4TqhUMe5sC8xG/onVrq2Zeh9xkyJlD3lqy0IKnsxPZx63GrQ+Aw==
X-Received: by 2002:adf:d202:0:b0:242:ac4:4a0c with SMTP id j2-20020adfd202000000b002420ac44a0cmr27076278wrh.32.1671198142063;
        Fri, 16 Dec 2022 05:42:22 -0800 (PST)
Received: from [192.168.1.132] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id b18-20020adfe652000000b00241d2df4960sm2369478wrn.17.2022.12.16.05.42.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Dec 2022 05:42:21 -0800 (PST)
Message-ID: <36ca8be4-511a-4d05-de36-0a1b0958f2a7@gmail.com>
Date: Fri, 16 Dec 2022 14:42:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v1] mtk-mmsys: Change mtk-mmsys & mtk-mutex to modules
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Hsin-Yi Wang <hsinyi@chromium.org>
References: <20221118063018.13520-1-yongqiang.niu@mediatek.com>
 <90c7e6f3-ecf6-bb90-5a9a-3fa1eb4b9d5d@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <90c7e6f3-ecf6-bb90-5a9a-3fa1eb4b9d5d@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221216_054225_147432_6A510B44 
X-CRM114-Status: UNSURE (   5.82  )
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



On 18/11/2022 11:36, AngeloGioacchino Del Regno wrote:
> Il 18/11/22 07:30, Yongqiang Niu ha scritto:
>> Change mtk-mmsys & mtk-mutex to modules for gki
>>
>> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> 

Applied, thanks!

