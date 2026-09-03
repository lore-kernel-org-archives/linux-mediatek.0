Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9890C61DD3
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Sep 2026 16:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V8sg4Ic+uUI0uGmJLbnp+7IK0wyVe9CAzpqU2xH+Oy4=; b=prpGNqeqc/F6g+qKMS7gEGqcU4
	yr8qlS/9UGHwo9wUrPTm/s1XxraWjJ7xk/Pa3dNfZaDrIgjziDd9W3wHnokPR2Bx5yVOcNJfMLLLp
	1PvbFUHKIKFXlzW5Lbij5PXBTznO3q6d1zE1++g/fLVIR+Q4Y/QSrXDTxptRvN1Ijr+jJ8uGP1Ovw
	CFyCZQQ6hHlPBU1QmxaA937tS7cjrEY+vwU1z78exVR6d6nveAR6xLxl37DWAQrTrKndhckjLNaoN
	7Mk3RujcVhL+mZxR/OT3aOZLsnZ9Az1N8YfKWqI3eMHAbevG8hc6OKB+acu4NUo9dXi1cJAraIGc1
	w4gpBPGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2AXB-00000000CMe-1UhQ;
	Thu, 03 Sep 2026 16:43:29 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2AX8-00000000CLq-2Zht
	for linux-mediatek@lists.infradead.org;
	Thu, 03 Sep 2026 16:43:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788453804;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V8sg4Ic+uUI0uGmJLbnp+7IK0wyVe9CAzpqU2xH+Oy4=;
	b=WZW7XbgpvCr8YnmPjGxQu/Ios6HkyPVzZYA1JjFPIc3J0o/lAE9cSmXdebveaMzHUfehQl
	jR4MHpSSBHr8GdbZ9dql/5NF3PUPDO2wiMSSgNXBE6iZlR1I/yTMSkgvy99DteNKrXO0+H
	vr7lFyUpvrXYwsuThzhQnBUPETAAMrA=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-18-Mbbe3gInNCG3hIx2_-63SQ-1; Thu, 03 Sep 2026 12:43:22 -0400
X-MC-Unique: Mbbe3gInNCG3hIx2_-63SQ-1
X-Mimecast-MFC-AGG-ID: Mbbe3gInNCG3hIx2_-63SQ_1788453802
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9390a2c895bso1072985a.0
        for <linux-mediatek@lists.infradead.org>; Thu, 03 Sep 2026 09:43:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788453802; x=1789058602;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V8sg4Ic+uUI0uGmJLbnp+7IK0wyVe9CAzpqU2xH+Oy4=;
        b=NHize11E3ZobmQRVSKtbu4leL1YVbuDdpL46cC5rAdfwE8eK4M3zRxpPk7JYTFdt6A
         EYDKTRoKDKsPu8VNOlL7qPa+sLORPa8cKkQap1uSHm8k5/S5vLeGgJ6gTQ5lBGt+jBJP
         0Zx0jSjBoJKBajKCTGw8KeoB/wMnithRbh1ncUrMgh5g0mVVIdDgCYTHSQ5/YfiORkvf
         JsKbqe+07qgSwZfyzblDKVC7El6C6tfqoVZdU83nHdxzDhYUNLm9GodcmU1oltZjElDY
         CrRSo+Pwx84q5VOkhYcwi9FMH+CXXnmnsjLR+NqKeLxK4fMyvUs07Xu6hEtQCkHizpfx
         EP1A==
X-Forwarded-Encrypted: i=1; AKwUvBzWP7VGVl9HL1B55tPQhN3wKM8dAF1XlRX5M5hqQmVFtB77/K5MgKFZI0OBeS18a711QUGQ3uR312jUZlGWgA==@lists.infradead.org
X-Gm-Message-State: AFuF++nCYh9PvvzkeLFAF/M8Px4VM11sq8RIlDnt7fZ/Hz48j554iKgG
	JD0uNcdloMcBN8H6tOZb7er5czL4uGUpuY3ngvWR/+vvNJjzcJLPaxtCJXZhJNtQDl+0sZEj+/k
	aLh07Kh3xkpcEfz8Zwv3K6TN6PFEYP01RwHnCgz7MvKqPQHkThzpJRBryW4UcZagAeqO18yqIH7
	7A7rWi7w==
X-Gm-Gg: AYBFou3rBhXB0W2AKA48AzZiJC23YWrTODSflQomuzJAKNPeYiiVWAUEwdllYHZTNWJ
	7Xj7Jh2ykG6v96fCLn7gZJ9YppGMHRV7NNWTa4Xc8zHeK14bYDBXdMqCCGY+FPZ6/908UgF1ZiM
	m7NfNDCrCfepE/ybm8tcoetZyvUFs37R9ce1MmvmoinJ7wYK+G7FFUet3QYfn2emFgFTk3CGTKn
	OvTWvqF+Tsc6bJhVj0NB+vocntygfj54+2CS9xjWtGWc76ldqGUCYSAckZn0+grepacfqif3bhK
	i8TiE8kYxzTFpEg4xc/7HJpYI4z68spUxHqtGY8eeUpOoOW8B37E/b8L6KALxmkddlzbfusWcYC
	QcUSGkOg0VJ0hvF+MIFJOeJsyiK7DIgAxlhxs+/Q=
X-Received: by 2002:a05:620a:6187:b0:939:6df3:d7f6 with SMTP id af79cd13be357-9396df3de25mr992394785a.49.1788453801813;
        Thu, 03 Sep 2026 09:43:21 -0700 (PDT)
X-Received: by 2002:a05:620a:6187:b0:939:6df3:d7f6 with SMTP id af79cd13be357-9396df3de25mr992386285a.49.1788453801386;
        Thu, 03 Sep 2026 09:43:21 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90e9ee270d0sm47491336d6.18.2026.09.03.09.43.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 09:43:20 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chen-Yu Tsai <wenst@chromium.org>, Ricardo Ribalda <ribalda@chromium.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 stable@vger.kernel.org
In-Reply-To: <20260831-common_clk_mt8173-v1-1-2d7241f70379@chromium.org>
References: <20260831-common_clk_mt8173-v1-1-2d7241f70379@chromium.org>
Subject: Re: [PATCH] clk: mediatek: Add missing depend for
 COMMON_CLK_MT8173
Message-Id: <178845378565.22448.12859439275506649984.b4-ty@b4>
Date: Thu, 03 Sep 2026 12:43:05 -0400
MIME-Version: 1.0
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=317; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=Y+oggqG3Z8L+JxkjNpwIvq7dXqEwG7Da2Hajvvt/Msg=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLJmLp4vln/w9uWnFpMnBh3+s5IzyCRo3jTeQ88mBbj8y
 GR/EvCgvqOUhUGMi0FWTJFlSa5RQUTqKtt7dzRZYOawMoEMYeDiFICJ3Ahg+O86/dGb5RGeNw8x
 nv+Y6dMhWWrzZE5A6oGlMo+NmKP7Cl8y/PfOydx3s8egMeH7vrvRv2R+z3jEeTuj8P9/m8aGvU3
 r23kB
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: kCCHB1DDj3bW9gCs3JRYnsqMin5kd0wUu3QDItiVc6E_1788453802
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_094326_748003_EFDD1BBF 
X-CRM114-Status: UNSURE (   6.49  )
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


On Mon, 31 Aug 2026 08:50:56 +0000, Ricardo Ribalda wrote:
> clk: mediatek: Add missing depend for COMMON_CLK_MT8173

Applied, thanks!

[1/1] clk: mediatek: Add missing depend for COMMON_CLK_MT8173
      commit: 84964d0ce3faed815e1b8e048ce5ce1c93badb18

Best regards,
-- 
Brian Masney <bmasney@redhat.com>


