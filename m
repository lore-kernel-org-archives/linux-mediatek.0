Return-Path: <SRS0=ohMe=LS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC06CC49EA5
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Jun 2021 21:01:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7E8C6135C
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Jun 2021 21:01:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B7E8C6135C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zQXlqhsI97jkQKnbQ0JMc3azlYWIwqDKXdvqg6MVGoA=; b=Cm3XChD0DlmVeL
	K6Pl6SIJahSm/IdfpP7zuzL+YEMmWVek3sJYaSZ7QPR6uD8DLMUSk83i8SQU1B5HN0D5k1OEnvClf
	ymMaBo5/TdK83PCfLilRm7MM8aMbIqGwcaQi64XGsI09LrhZdp1+wzCPPQ5wBfSTDwSWHtthYGKEj
	YT6XjYNdj/g8ro4P7xnKdOxyjS1if20vTwHvqauyHWtJn7V2FrnBB+HbhEPKyeDNRzjsj7CW7VsZ7
	vukWS6MT0AFrCvpjjljWrxGR0cWmQtx3/LTeH86X1ATgynomAmlq/y7vOW8IOIUbSHmAwh8n/Blel
	hyrmGbCvC9dh1fPadcgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lwWTl-00GIQa-L7; Thu, 24 Jun 2021 21:01:41 +0000
Received: from mail-il1-f171.google.com ([209.85.166.171])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lwWTW-00GILS-Jz; Thu, 24 Jun 2021 21:01:27 +0000
Received: by mail-il1-f171.google.com with SMTP id q18so7688483ile.10;
 Thu, 24 Jun 2021 14:01:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=lQ7uaZQ1CuEH+wcbbfLnBEPTLgmcis4Imz619rAGh+U=;
 b=gyMD2Gw77X3T1WHWqnWi+tU8vvDMWKpmZXZz3GrVUsPuVM1ghja1V+3LgcExdyKkYc
 IMKmEMXdLshN5kY5hNSAWYY7yecGK/NJdRmatt9FkrJCGLrsU/4CXpMWLWu9L78r4Wku
 PTJjz3b5Ix56ds6w+4BVx+SSjTmnQuxyEZnEwlwnplc0DpzR+1TBZCaRDnuXigUSqkdx
 41XkODEiryVGDiMOjuk5IidXaMjuJAVml90apRHpVWczuudN5HqNaDG7xWQ+FNlbxrqU
 2yD0jfY1tJZlY84TXibcROfsZ7vYHVt9v/YHI7P0VMGoZ7UpA/kE1qaRvHE2n8I2A18/
 TNtA==
X-Gm-Message-State: AOAM533gcMlAX9ylXEc+cYUA9gTpWlXLvFjZ05dScSoke3jN+waii9VY
 DFzHm6jLLH3zYWPgDM/8xw==
X-Google-Smtp-Source: ABdhPJy/E/soZkybMhfvYG1VhBDqLMlJoworQ0f3mJTvVh9S617pX6cxt26fqxIqiUumU5/DJHdLXg==
X-Received: by 2002:a05:6e02:1b04:: with SMTP id
 i4mr2775962ilv.263.1624568485538; 
 Thu, 24 Jun 2021 14:01:25 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id q19sm1965224ios.11.2021.06.24.14.01.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 14:01:24 -0700 (PDT)
Received: (nullmailer pid 1980287 invoked by uid 1000);
 Thu, 24 Jun 2021 21:01:21 -0000
Date: Thu, 24 Jun 2021 15:01:21 -0600
From: Rob Herring <robh@kernel.org>
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>
Cc: devicetree@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Stephen Boyd <sboyd@kernel.org>, srv_heupstream@mediatek.com,
 Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org,
 Weiyi Lu <weiyi.lu@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Nicolas Boichat <drinkcat@chromium.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 02/19] clk: mediatek: Add dt-bindings of MT8192 clocks
Message-ID: <20210624210121.GA1980225@robh.at.kernel.org>
References: <20210616003643.28648-1-chun-jie.chen@mediatek.com>
 <20210616003643.28648-3-chun-jie.chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210616003643.28648-3-chun-jie.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210624_140126_683487_38A42C0F 
X-CRM114-Status: UNSURE (   8.94  )
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

On Wed, 16 Jun 2021 08:36:26 +0800, Chun-Jie Chen wrote:
> Add MT8192 clock dt-bindings, include topckgen, apmixedsys,
> infracfg, pericfg and subsystem clocks.
> 
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> ---
>  include/dt-bindings/clock/mt8192-clk.h | 585 +++++++++++++++++++++++++
>  1 file changed, 585 insertions(+)
>  create mode 100644 include/dt-bindings/clock/mt8192-clk.h
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
