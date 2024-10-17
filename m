Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9169BD3C530
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Oct 2024 20:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=38u4+lvEP3MwxaW3jAQulStrKf3LnsiUKlHFBeOP4Rk=; b=Q/evhHHdmQEHHPPtJmXAUi9ahg
	jCG8puN2+v4yo5RzJF3kzXbYEjEsCOXH4dHjALhuByRd3x/idaLL/etvVn9ADXqLZrFY0wNvr/BkE
	l+v9Ql/qTsR/ptGWfM9MAuZOShYPloscJKtYMJyfUuUSLf6McEwEms8ZCaB8a97rmzgS7ecAs4R5r
	x1fRvRM21pbTEnN1wRAZEWsbPFOde8+X3QmJ00hRZr1X1mP3NEbyN7S81aGwoIRjprJmGTOwXPljf
	Yp9nfBUzQ6sFmyvhb1m7vns4pLPloq6gXrDz23yQ4LLqRRQ7qlXvAa+ZwTcWWWNN3QM4VpAoKKgho
	1FW++rbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1X3F-0000000G796-2pMd;
	Thu, 17 Oct 2024 20:24:53 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1X1k-0000000G6xQ-3jru;
	Thu, 17 Oct 2024 20:23:23 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-7db238d07b3so1114699a12.2;
        Thu, 17 Oct 2024 13:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729196600; x=1729801400; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=38u4+lvEP3MwxaW3jAQulStrKf3LnsiUKlHFBeOP4Rk=;
        b=ejgO2IzvoprL4EMGFviqo5wkMHPG5OeeSI4Ogh8aQ2vTOSV6AYXsjKXsS/xDFdVDs6
         hKXy/Jabwxq3bBPvDcQ62+j3Ro3roNDlCQ5M6jdhcElzaGQA5qE/D2HFB+SB/IcpvQ36
         t44VLMLkLw+aX0PboFXH2UF9b/6IKEcjZtyuyOWC8dUIAh96ascdFSSodJjxqy3CytMB
         NPxQt9QhfSzKjJCIVZCiwBYC9xx29BoKgIUyeNbJpcLyyl76pknHRcA10gLBcpdna/yy
         +VZ7J0SZQ7q3dvlaSQLi5OvmCatwMmmqbVUrphm2drHJLks+4wpjMFZPA/oxQQ2lsBZW
         KkUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729196600; x=1729801400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=38u4+lvEP3MwxaW3jAQulStrKf3LnsiUKlHFBeOP4Rk=;
        b=OF0FbEhIFqeBi+hJocaLj7J6ffOva2ber4h2yLzAQRMUDP5SjsXKHtbE5LEBHbsOCG
         R43BpOkflobOy9uwKVcAhh3rUueB7XG341thFZuztwM14wJTw3W5lSe7ixGiiEiQon3Z
         Yrymzm64sakbSoXAQTay6+05TZbnYBkTifrkf9cra/kOiFSx044O7NMvH0SoMvmL3BWr
         TnrWUe5hVhb8v56bUVa6qLGuFE29kHwMuOXE/t7TawJtUBHh+oJ0/4f/TWOhkNyq4OO3
         6sQreY+ZcBW4emk1w6BLXJY1QYhv18x1ItW4W3ol1hxGbuDXbHIqMuh9wCmcZn9T0jEv
         54EQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYE5TD2yjOB1KUx5GLzbK4Sa1078aWGto8V96ILX+wISN+wE+cbofY+H/QDyFUT914esy2Q0Wg7GRz3kGFsg==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywl/26MHEhoihO/12IniUErC3z/wahePVBdNHXwK7N66DrH7lNg
	yfVn7MpD9it+/s1LfRVwMSf26aGu+9jzJ2oIB4Ut3DEDbFdtBN62
X-Google-Smtp-Source: AGHT+IGMAWQD6p2HxyTayb3FsLXe59RkwnRVgQe15THThCv3iM/TQVQ9CJUSlYItiOMujnRF+Gx7RA==
X-Received: by 2002:a17:90b:4c8f:b0:2e2:d82b:d144 with SMTP id 98e67ed59e1d1-2e561a3281cmr234135a91.37.1729196600158;
        Thu, 17 Oct 2024 13:23:20 -0700 (PDT)
Received: from archlinux.. ([2405:201:e00c:517f:5e87:9cff:fe63:6000])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2e55d216012sm232832a91.0.2024.10.17.13.23.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 13:23:19 -0700 (PDT)
From: Mohammed Anees <pvmohammedanees2003@gmail.com>
To: angelogioacchino.delregno@collabora.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	matthias.bgg@gmail.com,
	mchehab@kernel.org,
	moudy.ho@mediatek.com,
	pvmohammedanees2003@gmail.com,
	ribalda@chromium.org,
	sebastian.fricke@collabora.com
Subject: Re: [PATCH] media: platform: mtk-mdp3: Remove unwanted else in mdp-cmdp-prepare()
Date: Fri, 18 Oct 2024 01:51:27 +0530
Message-ID: <20241017202127.2943-1-pvmohammedanees2003@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <f771788c-bdcd-4378-a9c4-4bd6bbf93591@collabora.com>
References: <f771788c-bdcd-4378-a9c4-4bd6bbf93591@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241017_132320_948590_F9D2242D 
X-CRM114-Status: UNSURE (   5.21  )
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

Thank you for your feedback! I have made the 
required changes and sent over the new one.

Thanks!

