Return-Path: <SRS0=uG8S=M4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 122FCC4338F
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Aug 2021 15:35:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D407060EE8
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Aug 2021 15:35:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D407060EE8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=qmmfwbqYIVG/wphkYFPSNvao6hs8RF8H9IOSL50Av54=; b=n62AJ+BPOTta3kv5FYniznGPTI
	BOQGipIpkdGBAq/lvoUOpD4a+gynbFh2VOnfkk/i5vnncigalCuHAFH+exA8jHZzq7MVz24H4hl21
	6jJnTulQVNIDbGp8NMJl6dprwBhRH+t+sRWM/3ZDinxuO6PoHvWpG0nn1X/BK0v3QRXk1s05Iy0Ho
	e60FdgxxJm4RmQrf1Dh6Atn0WGc+j1iJ7qqJCkh/HkChN2u8c/1mLZGoHVlp/giWmJgAw5V1svLX8
	VhaeZnhi0vz5pXNUVxtQuEi0EYz1126JdEM6mjOSITvyuwJdoCqIOLwOBIlvtXvahhRZi9XEwtCdw
	+qbIQPbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBfOu-00A4de-9F; Thu, 05 Aug 2021 15:35:16 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBfOr-00A4co-4V; Thu, 05 Aug 2021 15:35:14 +0000
Received: by mail-wm1-x333.google.com with SMTP id
 d131-20020a1c1d890000b02902516717f562so4014108wmd.3; 
 Thu, 05 Aug 2021 08:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=e8yF7W5kwQSE15C2w3dwLP7AW+KLjZQaFC34eOyj880=;
 b=Px2DyqRFw+DcAzN9Se80GLd810eRZUri4kxdIHMZeKFsJfh3/6FtPXhGCV9c3s2lye
 VI8X6Wr0DsfEX/S/vS2BCJHenbX67o2jCmoOJBTgqsfqFOHwHADmduKKudoFp7R2MjGx
 IQyzhbAYlZwhQ71Zb6Cvo1QKixvMksvjDQns0i39Tchkn3CWZ6SGmGOZtDkJYmnW3VAr
 n/fmT5sn5+vScAJK705SI1CF0E3p5RFwhfHDFKkXpFViT/TcPVuY2IXHyzomdWHEDx1g
 D4gyzjLc/ys6RMSQdQva9eBlbcuqjYqikGClDyxn7hfsS7XMLW9ggv+0BzTAbLzt4Vzs
 nPhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=e8yF7W5kwQSE15C2w3dwLP7AW+KLjZQaFC34eOyj880=;
 b=fIAJbXOHYeIbcTncEBXCLC3tgYTFmZH5/4cN3pnRGTzViGLaxy5xeshS8KLTooeILh
 xEEEkl5fi024sJsZDq45njuTKWLO/IVHsH9YLOR6X5/1msLBUKXNvNczm349Tcwh3eew
 4UFgcyRHizbSD6lKQZKncfu+4FLIyQyiMxcEk23onUkvvuKp45mCzdrteZVNmu58Dug7
 +qWWV088rotFtnHQs4nX4WG+mWK9H/0ln9YDQ7YzRD12snC3EmH824H8gFKl1pzE/90G
 8NaOPnrXiYyNKcIXyffRDkYIzJ0g7LglDgzrdnV02a/6NauZA2CyiIz2MgHwUa/G5Gbn
 CEKQ==
X-Gm-Message-State: AOAM531ZXi6EVwkUvp1KGoihL2on4xLrpG8ogEYeHfSkPStpzFAfk3oU
 yHE+yygE+cLmAyxzzuDEFSg=
X-Google-Smtp-Source: ABdhPJzUbDsFxcl3SF9H4VKEhhq1IOGoLpg6RQ0UVVnvwVDJP321SBzN7VPw7laWZejK9voRoiB63Q==
X-Received: by 2002:a05:600c:4f42:: with SMTP id
 m2mr16383078wmq.47.1628177711058; 
 Thu, 05 Aug 2021 08:35:11 -0700 (PDT)
Received: from ziggy.stardust (static-55-132-6-89.ipcom.comunitel.net.
 [89.6.132.55])
 by smtp.gmail.com with ESMTPSA id w13sm7901714wru.72.2021.08.05.08.35.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Aug 2021 08:35:10 -0700 (PDT)
Subject: Re: [v14 02/21] dt-bindings: ARM: Mediatek: Add mmsys document
 binding for MT8192
To: Stephen Boyd <sboyd@kernel.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20210726105719.15793-1-chun-jie.chen@mediatek.com>
 <20210726105719.15793-3-chun-jie.chen@mediatek.com>
 <162740843452.2368309.13157283201271440368@swboyd.mtv.corp.google.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <b98aeeee-c544-3025-cc06-ec04be7ab638@gmail.com>
Date: Thu, 5 Aug 2021 17:35:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <162740843452.2368309.13157283201271440368@swboyd.mtv.corp.google.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210805_083513_233166_7EC5D0D6 
X-CRM114-Status: GOOD (  11.37  )
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



On 27/07/2021 19:53, Stephen Boyd wrote:
> Quoting Chun-Jie Chen (2021-07-26 03:57:00)
>> This patch adds the mmsys document binding for MT8192 SoC.
>>
>> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
>> Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
>> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
>> Acked-by: Rob Herring <robh@kernel.org>
>> ---
> 
> Applied to clk-next
> 

Please drop this patch. The mmsys binding will change to yaml in this merge
window and this will create a merge conflict.

Thanks,
Matthias

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
