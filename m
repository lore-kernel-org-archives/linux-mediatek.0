Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 219A1C79FBB
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2026 21:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zC/TwPpzsaghSj/8QRD9k+IasDdKbL8GKT8smkkknMk=; b=YXCwNwADOEegGpS1221Oh/vnW1
	inOW+kW2TYuT2AGvFI5Q7RJ0kT82HqkFJbl0g0a55Wkl3P8fLfY3phNmH8s/tixXiiS8gX/WLumSK
	xTxjEHs6t7nbLtd81i3JVWb3yzI8Y0wl6ZJlJJouMOqruo+Isn2zs/HtU5PvuraCeeVGdidTlJ/vy
	n0cwwgKnt3IEHZYfKe6rV4gJPv12kEQlo+y8zp4kl3DPQ4PW/iPx5sEs3iBPOs23qbYT3dcn4eu5J
	3LK4W9sYO95U9EQdVNUw2DV8LHc9bVZNMwjnWyK7BqhBiTJsCiU+KK4/Q/r7atfUTwIDdoIV9SJkL
	aeWk9LWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4lyd-0000000FOTs-2Wic;
	Thu, 10 Sep 2026 21:06:35 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4lyb-0000000FOSr-2H1n
	for linux-mediatek@lists.infradead.org;
	Thu, 10 Sep 2026 21:06:34 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-4858303de5dso192492f8f.2
        for <linux-mediatek@lists.infradead.org>; Thu, 10 Sep 2026 14:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789074391; x=1789679191; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zC/TwPpzsaghSj/8QRD9k+IasDdKbL8GKT8smkkknMk=;
        b=XvF32akUcmrWKIen3+UMqJaxy7L1DZqcOqUjs33csZDrKlIdnwAAxYG0oRPhfjS0QW
         qaGWEXpvhREJL5wnLIK4jX97N2h2DbtEDn6RLlKPh9VT1jZ1MAQgFpjUEHQ3Y2QQ4h5B
         gYkiDDGHyJMYSCtKSQAG828Kk0Bvr84QCVlq6aV9na8Q/GTM6Voxd4NOrSuv//o2OEwu
         UdDNv9T7qqS4j4PgWBhYotbJBVnvvhYMtajYVtln/Taxoj6Ii1NGT8EiAmkNBj1zhJvQ
         DIQ3j45aas2eYMU8GBJXr5P8q90qj0vVn6XiUIGxZ51bTyx9X1sSH60KfhoqPU+porZL
         5wbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789074391; x=1789679191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zC/TwPpzsaghSj/8QRD9k+IasDdKbL8GKT8smkkknMk=;
        b=UexiXbuL2APAM/q7M0wAgwzlm4i3tGvwWgW+NV6W3n2rvlJ7t45pnJvSXUJdS2X40h
         nARPUh/tMF2tZ2LRylbgOa5F0iXrV1CgOQJ0Kapm9vys1Lyk37AR0OEMouQSMKIwevLm
         qmeM9L9NN9zOER1O5lsIJJFJGvjon2fYRq6uK4ww12t4/Km72PKGR75vcYBjvJSmsTtb
         zeXU+ZVBeW/4kVfQTfQsEXgDNAyChbHBwzTO2JEHP2icsPKehaTwdi67dTyowiVsN/8V
         yO+isjy9x/zRgWeSvio0p52wTf1uFlJjOee7LjYesS/CTh0Jq0UKg+Ja9oGYQ3X4RNQq
         eJyA==
X-Forwarded-Encrypted: i=1; AKwUvBxaJrSvzulmwminnPX10GArdTutTRxWkFY+nwQ5y9YNEPLOl+5QDt4/Vom5ctlh9JWw+jJfS4yFFx+mJL2b5A==@lists.infradead.org
X-Gm-Message-State: AFuF++k1Dax6zogwo6YL92ncO96nI+858IXGkQaM/lhFnIAa7qbVekNn
	ok9SMqio+jajnpRB2Q4Aywy0eGVTBxLaIzEAl4/qg1iBLfrGmvSnHZ4=
X-Gm-Gg: AYBFou2ej3iDvlHKnjEwtj7TRWqyH7kr3XAjIck0Mbym+8ThnpyEeFTMlMi1P2VYdwT
	+aucZgLMXh8r1rEAFIc+x298HBLRBkU5g7Eh3o9cjcutJKIbGxnGt/tXYdBd/hPO8Xo+nrEsQqA
	PAZkLlBVgtTXb4Z6nCDxa/C5DT+ZLiKUNfr4BEgHfoTqX2uHI+V3TEM1vquvIpPs85AkVPFVLzc
	y14fIqucdWA2S7gAtjNQKcG+nlTvQKIVZ0IjBMeRfr49vDBWp8DT7BrqKwHdXG67+xloiEVsJG2
	nKGF4RsLdRknb73NNwM/dcoUz4fTdEnMeBvIgKn3Aud2jdRdj6o19i1ctKSopWdKlcRhWbiGaTQ
	wqUTOSb8rgOxR3jenbIpP2+suULMod1J2N0qHLuAPrLqiwqWfmsm5EVa+pTsdYOXHJoWWi1EmRx
	/2W4lHfBIkfXLa3FcDYz2j6dLM5CuoUxhcmChjP3WKj5AJp4JbWhq8IMFtcKq0KhXeFhGlfYxE
X-Received: by 2002:a05:6000:2f86:b0:486:e73e:abe5 with SMTP id ffacd0b85a97d-486eb2e269amr1118040f8f.10.1789074390922;
        Thu, 10 Sep 2026 14:06:30 -0700 (PDT)
Received: from fedora ([46.8.219.5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb330bdcsm1196375f8f.13.2026.09.10.14.06.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 14:06:30 -0700 (PDT)
From: Vitaliy Sochnev <sochnev.v.74@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	netdev@vger.kernel.org
Cc: upstream@airoha.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Vitaliy Sochnev <sochnev.v.74@gmail.com>
Subject: Re: [PATCH net v3 1/2] net: airoha: handle RX_NO_CPU_DSCP interrupt, not just RX_DONE
Date: Fri, 11 Sep 2026 00:06:21 +0100
Message-ID: <20260910230621.730983-1-sochnev.v.74@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260903173355.62780188@kicinski-fedora-PF5CM1Y0>
References: <cover.1788286284.git.sochnev.v.74@gmail.com> <17f1beec505b87a4acf16557386a978c98f94b97.1788286284.git.sochnev.v.74@gmail.com> <20260903173355.62780188@kicinski-fedora-PF5CM1Y0>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_140633_581227_6A3C2E88 
X-CRM114-Status: UNSURE (   9.20  )
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

> Since you're not sure you should probably add a timer to retry
> later? Maybe the IRQ is not needed at all, you could just check 
> on allocation failure if the right is completely drained or have 
> a periodic task a'la fbnic_napi_depletion_check()

No timer either: the depletion path is not the one being hit. Please drop
this patch.

Instrumented builds logged zero NO_CPU_DSCP events across every run, with
REG_INT_ENABLE(bank0, 1) reading 0x839F839F, so the bit was unmasked for
ring 4. page_pool_dev_alloc_frag() never failed and q->queued never
reached zero, so the ring never enters the state this patch handles.
Images with and without it stalled identically.

The stall was RX rings smaller than 32 descriptors, fixed by 2/2 of this
series, e84b89f17a12 ("net: airoha: grow the small RX rings"). Details in
my report on the cover thread.

airoha_irq_handler() does discard the NO_CPU_DSCP bits, so handling them
may still be right, but I have no measurement showing it matters and will
not claim one.

