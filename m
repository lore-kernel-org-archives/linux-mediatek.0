Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC4DBC433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Nov 2022 05:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S1Idlevq+1pR9IxtCs+CXM/bKSijLUs0q/kM+1SG5ps=; b=bWPJH6zT0pyGeHr3EYymf0QVwb
	7/bGAoH5TH6vuYJ2C9OKRO6ETxbSaSJ6sHNwtvh4DZbA1xNSkbZWf4mlKd1jH0Z5IeQWbcSrLMXsH
	PjGGhqy//vOehPffG3IEKSDjSOggvMC/uWl/bGC3Ek2rglsOT7FmwF6Txfxw7zQNAQ/yv+LXnEoUs
	NerMGb03qWo2wGqXggU1Tx2mcH5V/+d+JEmeFOnUIX2qg5cEGkdwOYVJwpfKrGyNCf/5D0nl3KleP
	HvRMqT2xxue/93o0M0UPgeKI3sYBhWU7LFvf6RR7r+Tezrn/TKxZGXTXsddK+ZqMBHqREQgTvcl8H
	BThWdjgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovu9D-00258H-Ts; Fri, 18 Nov 2022 05:42:43 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovu9B-00257S-Ku
	for linux-mediatek@lists.infradead.org; Fri, 18 Nov 2022 05:42:42 +0000
Received: by mail-lf1-x133.google.com with SMTP id c1so6511850lfi.7
        for <linux-mediatek@lists.infradead.org>; Thu, 17 Nov 2022 21:42:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=S1Idlevq+1pR9IxtCs+CXM/bKSijLUs0q/kM+1SG5ps=;
        b=fBKazR34EOd9IlI9Z3uxVpTitXx+sJREyfYAuv/2nS/cJ19yUV2MKRFyD1oEss/1j9
         +MHg0mcaiTi2MMxt7yEXrvDrfD2sCvtsJ1OBYXgBfPpdNGa8yYny06olNgyQQOgcm3QA
         ErUkjqP9drM1I5wv2ZRGA6e4jpqynTCzXRTbpLJbDXHKBx0Mon33tqQM5FqP6FGstFFO
         lidM4GxdjYa3/m2gkZpmccF/f1yyeIiKNjbDxUECXHQ3RaZpEpMmxj6Hq/s4Q1zwFWNb
         0v52SApEvPBlEiWrfE9+zWt1C8fzWrzILBI7de6+7XcmAQgf35hVtXKozazjmz7Tq2kK
         kJcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S1Idlevq+1pR9IxtCs+CXM/bKSijLUs0q/kM+1SG5ps=;
        b=NMtGvhm61G3XchpHtC/q2hOGpW3/g0Emm6CfRNETBaEn9hr1RaHUE+9+0FHXSDEs9v
         vMvOHrydZ5zm8+PBNJP4O/nYo3v8ocOCMRJQQXMvUwgsRg/s/O9dumnDypWJgwwDCO5m
         2IRlW3gL8g4JY8dFWmnrWR/SuSlcMyVz+fqdQd/GeIBmcJKPQexd2uQCJZfGR2DZLEWv
         a9iP4BMlO0RwUBfj49DhUU4hTON6FV1JMWXOJfk5o+fjVgifdAfwHp4zaLW8lKpIsT3C
         KGta7CWsX8/d4uebMfgGGfysQ0BtkEh5hbs5QAUIoNmIOwq8rY6q22yUNDtbTlrKvHVN
         vDpg==
X-Gm-Message-State: ANoB5pmE8IHDq3J4v6I1S+Q9ursn2EKNbLrRq4kYd3NG1OnsO6ClYjGU
	KjYjDRwDBNn5kn7iaxTe/s6q/FWxXi69/x7JZQ==
X-Google-Smtp-Source: AA0mqf6mk3iGB58/qI/27zszWRU2A1nPFyd7t7C79yoW0QG06IVxbpzAHRBvKv9dVGVjPu3C8R88gMBdXmNQnHzYu9Q=
X-Received: by 2002:a19:8c1e:0:b0:4a2:48d6:2181 with SMTP id
 o30-20020a198c1e000000b004a248d62181mr2094023lfd.591.1668750156585; Thu, 17
 Nov 2022 21:42:36 -0800 (PST)
MIME-Version: 1.0
References: <CGME20221118044223epcas1p12eab9a6fb08ec382625b3fb43f401e07@epcas1p1.samsung.com>
 <20221118044136.921-1-cw9316.lee@samsung.com>
In-Reply-To: <20221118044136.921-1-cw9316.lee@samsung.com>
From: Stanley Chu <chu.stanley@gmail.com>
Date: Fri, 18 Nov 2022 13:42:24 +0800
Message-ID: <CAGaU9a-FVGqeQB+97WGgWaMcFJUtKbsT_N7sWDza=NWkApBK1A@mail.gmail.com>
Subject: Re: [PATCH] scsi: ufs: ufs-mediatek: Remove unneeded code
To: Chanwoo Lee <cw9316.lee@samsung.com>
Cc: stanley.chu@mediatek.com, jejb@linux.ibm.com, martin.petersen@oracle.com, 
	matthias.bgg@gmail.com, linux-scsi@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221117_214241_705742_7EE259E0 
X-CRM114-Status: UNSURE (   5.01  )
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

On Fri, Nov 18, 2022 at 12:50 PM Chanwoo Lee <cw9316.lee@samsung.com> wrote:
>
> From: ChanWoo Lee <cw9316.lee@samsung.com>
>
> Remove unnecessary if/goto code.
>
> Signed-off-by: ChanWoo Lee <cw9316.lee@samsung.com>

Reviewed-by: Stanley Chu <stanley.chu@mediatek.com>

