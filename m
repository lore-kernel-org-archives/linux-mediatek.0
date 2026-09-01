Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82FF2C624D3
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Sep 2026 16:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eQ+b0FuUbkgk3GjbjUprpVwWlSOMhpS2zwmbdYuf/ow=; b=kcYf062pOFn9QStPTodQB3h70p
	EMqCw5O3E0YWJZ6memUOWlZOB5M9d2VuL5M1RQQdRzX4nwA5BqCUqNBJ/mzD4zAp/q35RbWh+ZMJt
	QwzmEJTQ/824vbi5PHFB0EKism9b8FejtULvhIeD1bqMvJ7oUU7s/Jt9FY9vge3tQexUmSS6J1G+Y
	QAqzRWmOGghMW0KmSK6Rsmx2dGEbVIbCMqjlk4z/gX+U1zXPHm6mQwdcAj9p0Ejx3IhD2CzAnJa5f
	+MmyG/S2nkQVVhaaUFpVZEUjJOgCrwB1ezsKNIrdMbLGwuHhqgVBkaMvYIktYJvKHSMndWgjclOou
	xVz1AEBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1RRD-0000000Cfha-200w;
	Tue, 01 Sep 2026 16:34:19 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1RRA-0000000Cfg8-3lov
	for linux-mediatek@lists.infradead.org;
	Tue, 01 Sep 2026 16:34:17 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-39da69c5ba3so103051fa.1
        for <linux-mediatek@lists.infradead.org>; Tue, 01 Sep 2026 09:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788280455; x=1788885255; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eQ+b0FuUbkgk3GjbjUprpVwWlSOMhpS2zwmbdYuf/ow=;
        b=oRGsBWrvJRNf+yf4vKh9etM1FmikAs9ZNkQDCgln5dQ99uG8u+dYE1uWKqhMXTMvpi
         6Bq382ku/x7xn6u1MDskf43o6PByyBhcqySZP2ZLqaP8g1omq7s8g9FUM6xI71qFrDfv
         T+t5vGAfRQ55TiViz1Oh1tyWXG9ZDTw3uu/o5YvpiKuDAJGtYzYafzAH7VVmFSTaRXor
         mVRwsBaIV8fL8nwWqo/KksDLgTnuEwQsoiGOIuEVqTKyEhde6n9S34crwz0dDCGyok9W
         ubGozWAdmpj/XMScWEikudYuSpr2L0wnadqF63FGAavtVF2Hrms/EfB+S2Z5o3pEhRLI
         UVLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788280455; x=1788885255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eQ+b0FuUbkgk3GjbjUprpVwWlSOMhpS2zwmbdYuf/ow=;
        b=UAm41rx/9yjaId5HfRnU2eZr5WMoIx7K+261tiue03yXajmWs4ahStVfqdCxQYnMT2
         QQxslgmGY0yY4x/8sjJfkAQr8Kc7+HNEN6JHihwypZQnQpam84o3Smys7rkKhRIbkEdx
         xCA0xGTzS7jjb1SKYJzXBhy50TADeImyZ3a2kFCb6y5y5BaqJRroNeDMk2nOTzlYUdYG
         itx0mdEbEuQkmqrGbHqS/ObbVU9cZn9AZXzFc8Ahyb06+P6LlUu+kLmXNKy3OSjNKPzQ
         RCgxGowyXFXPvz5lRhCL5YdrsqQ3iHbTr01Dq2s6CFWrO+7u4FBEmXf4M/eNEgTUXxPa
         06Mg==
X-Forwarded-Encrypted: i=1; AKwUvBzfuEGlcmHy7W8u08ifrP2lZmzZwK6arVBKYsI4V+PQdxQusuNutwknotyDV1IayTsToFGWR7UiJP3O3T8qjw==@lists.infradead.org
X-Gm-Message-State: AFuF++lQji3pt7z1Fqn/Y/FiaJ4NHTPhciS/PjCW9sLBaOaNNlB5Sq2N
	aYmKdiSQh9qHaylXCumArYUggr1NNLpofQW3kL/EZsZQLYwhng3Mt/U=
X-Gm-Gg: AYBFou2MM3krHklG9EhZslJxqh6MGXJHkxGraB4AA+wuEgXHGcdY8f44R0yirRZ+Gkl
	zO+j6TwRMW5UrivH9l4XNhpSLE/xBBxnPuvJdP0IHLQYhHQot044BMxU+ocskubZFCp0IO+qwYb
	OGpWQK4lZlaKAA94ekpYRJB6Gsc0h3d5171hhNEAM0NCYlNz1U0ozhxC4zy2pzucPbC/5RrVfLJ
	IN27swIsRv8geRH4yG7yodf1kZV59F8dE0ZLnF5OjKos60uG66HnPmLja97ybQJg/FPLZoHFtMg
	9OEDJe2lJyY9qvKsZEAsqsXkrycVeupy1J9HNtNjMba84lJlV02VQZOZ3J8/X39UzX/5T3cKC83
	fHs8h0pjNq87fUhSZfH3plK1KeJM0lD8eOaDTo824xFuOIjHWz9lErF2m/KUYe8L59Bfn2vlaZo
	km6mEUzG4YzSLE3bYZAXmQxER6cewymMnfUfAkUYtwJTgNI2zhm3/T
X-Received: by 2002:a2e:a554:0:b0:3a2:fd1:8a8 with SMTP id 38308e7fff4ca-3a3018ba808mr78554981fa.1.1788280454464;
        Tue, 01 Sep 2026 09:34:14 -0700 (PDT)
Received: from fedora ([92.36.3.203])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a34a8f03fasm688001fa.9.2026.09.01.09.34.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 09:34:14 -0700 (PDT)
From: Vitaliy Sochnev <sochnev.v.74@gmail.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	netdev@vger.kernel.org
Cc: upstream@airoha.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Vitaliy Sochnev <sochnev.v.74@gmail.com>
Subject: Re: [PATCH net v2 2/3] net: airoha: recover RX ring after hw completion stall
Date: Tue,  1 Sep 2026 19:33:48 +0100
Message-ID: <20260901183348.40949-1-sochnev.v.74@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <apaA5jDYH71F0JaS@lore-desk>
References: <20260830095717.37218-1-sochnev.v.74@gmail.com> <20260831234701.206021-1-sochnev.v.74@gmail.com> <20260831234701.206021-3-sochnev.v.74@gmail.com> <apaA5jDYH71F0JaS@lore-desk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_093416_940975_23EE97CE 
X-CRM114-Status: GOOD (  10.09  )
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

> IIUC increasing the ring size the issue never occurs again (correct?). If so, I
> would drop this patch for the moment and add it if it is really necessary.

Correct. At 128 the stall never occurred: 500 forced PPPoE reconnects
over 20 h, ~37500 samples, zero triggers, plus ~994 cycles in earlier
runs. This detector was compiled in and armed throughout, so that is a
measured absence, not just the absence of a visible symptom.

It is also not sufficient on its own: at 16 descriptors the recovery
fires roughly every 35 s and PPPoE still never completes, since each
recovery flushes the ring and negotiation restarts. The ring size is
what fixes the bug - and the other two patches on their own are what
ran the longest here: 508 forced reconnects over 20 h 32 min, zero
rx_dropped/rx_errors across 39158 samples.

Dropped in v3, just sent. I will resend this one with evidence if the
stall ever turns up at the larger ring.

Thanks for the review.

Vitaliy

