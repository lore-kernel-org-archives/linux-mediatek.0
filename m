Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FE35C3DA59
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Jul 2024 20:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=; b=mKq0/f1cuzmqyCLwOOQIKa8n6Z
	7D3rqEv+q8+flhfIHi4UAltRH418KsP7K75iGRzlgP6G1UmFcAVbsT1Vy4wSPT3jLzpaYXHkBhRJx
	U/dFF7hfJXq37X43FlONhm3V6tRK6lWPFT7jvYx5BIoHU/5tQEo/KcteyH1ycpG+1NI+3a6wruYBy
	/rFm/60s1WSHm+/yhncDOPgA3l+wJDlm29oNvA4A2n+pVo6FuU0knrwpLxyV+egWvxiStBBC+kW0/
	k+15VvKDTBJP2kJJnZOtu0kSNPtfu8NUSn6pTtTURgvzPqZo9oSeJBOFM2e5EyWVBTcsdBiutZFva
	g+u4gNmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUuUR-00000003mHB-18HF;
	Fri, 19 Jul 2024 20:46:07 +0000
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUuUL-00000003mGA-1IS3
	for linux-mediatek@lists.infradead.org;
	Fri, 19 Jul 2024 20:46:05 +0000
Received: by mail-io1-xd2d.google.com with SMTP id ca18e2360f4ac-816ca307407so79466039f.2
        for <linux-mediatek@lists.infradead.org>; Fri, 19 Jul 2024 13:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1721421959; x=1722026759; darn=lists.infradead.org;
        h=content-transfer-encoding:tested-by:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=BAXw/dk/uBe6bXb/XMIAhtmTDkas1NrHFX7fUE1Y5papRUfu6cETgENTpYKNKnogw5
         8X2eWdgd8pzonwkcrrHhcXYPvv8xWqwCeD6Nd/BtxPU5YrWwkQldCjycXWMciwxGGkdt
         uds2gj6d4ecpiGkFfxb8eJI16QDS9EkkmlFz4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721421959; x=1722026759;
        h=content-transfer-encoding:tested-by:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=s8Kn/x6MfJPbNBVhWp90J/U7GQu4qGn+pkf4xmQwMQnAibVDFG911tPjq9kjUM4JrR
         oqK2U9yZnKc0Qe4qt/5NbUCtCe1OkXYCnt6RSGSybkrLy9ZM/5S94+7pcNmxWw/QfC9F
         TFYVmMZo1SGRKjpe9LvI0g/GraZKobt7fCCixSHlyy8UEgH07IhKwf5WTJmzGfugGQHY
         th1qHjN/gptZ69L0j216pQvEhRGgPqC5ClxEoEIept14ih8tqrXBJeSFSXUfMyk8dQ45
         0EIqkAd/gR8tNCxLsn551Tk41qIBnNpyAQpCv90ZvNqYfhqpVQy91JCiYvlpZ/sjQ17s
         F/0w==
X-Forwarded-Encrypted: i=1; AJvYcCUZL+5f9FG0a6KOvw/KPKQQ/4QE6Jo1Hvfq9dgPN+mhbaBiMFbKod5ADTahgEBX4nU9XmQLqvGiA9E7hkD1WbEKxV30b+ClLpf823R/mQlnZ1Lm
X-Gm-Message-State: AOJu0YzjBXkXJjNPS8kHtVDDCVg4O0m5601iHXT4wwuvIcHJ7JJotrHc
	UVgwPzZRaPXFCicdpvL82ltQEno6P2MJe8At/DGu4FLLzgUaNfh6odgpqtsJ/A==
X-Google-Smtp-Source: AGHT+IEWEky2R8AmLgCPI7m4VCZ1SzL/kd0LYvnZoSI1Au9xSLRjH3/gDGRwPRdrVeeIMeSHpOLBWg==
X-Received: by 2002:a05:6602:3f91:b0:7f9:16da:ac79 with SMTP id ca18e2360f4ac-817125e31c2mr1240441339f.16.1721421959663;
        Fri, 19 Jul 2024 13:45:59 -0700 (PDT)
Received: from arowa.c.googlers.com.com (214.62.225.35.bc.googleusercontent.com. [35.225.62.214])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4c234404f4esm471700173.162.2024.07.19.13.45.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 13:45:59 -0700 (PDT)
From: Arowa Suliman <arowa@chromium.org>
X-Google-Original-From: Arowa Suliman <arowa@google.com>
To: mingyen.hsieh@mediatek.com
Cc: Eric-SY.Chang@mediatek.com,
	Leon.Yen@mediatek.com,
	Quan.Zhou@mediatek.com,
	Ryder.Lee@mediatek.com,
	Sean.Wang@mediatek.com,
	Shayne.Chen@mediatek.com,
	Soul.Huang@mediatek.com,
	ch.yeh@mediatek.com,
	deren.wu@mediatek.com,
	km.lin@mediatek.com,
	linux-mediatek@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	lorenzo@kernel.org,
	nbd@nbd.name,
	posh.sun@mediatek.com,
	robin.chiu@mediatek.com
Subject: Re: [PATCH v2] wifi: mt76: mt7921: introduce CSA support
Date: Fri, 19 Jul 2024 20:45:56 +0000
Message-ID: <20240719204556.1029453-1-arowa@google.com>
X-Mailer: git-send-email 2.45.2.1089.g2a221341d9-goog
In-Reply-To: <20240530084455.4290-1-mingyen.hsieh@mediatek.com>
References: <20240530084455.4290-1-mingyen.hsieh@mediatek.com>
MIME-Version: 1.0
Tested-by: Arowa Suliman <arowa@chromium.org>
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240719_134601_371276_9A5D8C89 
X-CRM114-Status: UNSURE (   4.18  )
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


