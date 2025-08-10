Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84240C87FDA
	for <linux-mediatek@archiver.kernel.org>; Sun, 10 Aug 2025 22:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Message-Id:MIME-Version:Subject:Date:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CioeoXb5/QvchbQJCxl5o+yrQjp6rhhswejt/srDq7A=; b=DIAcv+BPtigWRusNjfUulgH+ms
	PSLNNVm15MQyWHS0x5F88yXB49BHqFVuegmMnfA5GCSX5Z/w7Hl93KG+RWmNlTn8Z6N4YhgNtkIRa
	NWHgrzUPVe1b4FJa67aNR7x1gdhELeRONNYWmRHOznPpTGPRoQj53h6hXRNyMxwkr9vH6la73g4e1
	s1rhr+bp1vDsvntJU3wnG6biP4hMrb8+Xk1bbaXbEy/ClpiJbhJgJWb3CdE4lYQlnGbO3p7PD8tBc
	Pi/oeGytxE/ElnarwkoHHvw2K4CO1CXFAJ9nTERSo/oKB+08+3hoF4zDgI5Vh8VCl6wvengWwpFcL
	TQs+cOMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulEUI-000000066b0-2aEm;
	Sun, 10 Aug 2025 22:25:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulELN-000000065yw-0Mvo
	for linux-mediatek@bombadil.infradead.org;
	Sun, 10 Aug 2025 22:16:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Message-Id:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=CioeoXb5/QvchbQJCxl5o+yrQjp6rhhswejt/srDq7A=; b=blstfSpE7MYtEToVfvB9r9EhLD
	3RcNakYWWgvlWZPKxdt65otDEU0tqJF2E5b7keSO2i4QFi3TifZeW5k/1uCNswVmoOp2vnwCE39ot
	DIujOdr9Slrgb9l9tBHb9mhhI1wIPb/Tak2Xp418o3hvZEb3AGAU/KwxO5cytXOgm8oCkXTohUO0B
	nBO8pGDSBKUN61PSJT4McPq9QMFEzSkNKwgXj0C8zOj5bkKjFaOpnLN9CFhRmQ3LoR8MdSSneNKTp
	Htxs3catFng+IGZkklBa+XvP7WYO7wF+Bh3gUVVsz6CI12xGrgCwo2VITsue96AFj8k7V+gi5LejW
	8W3ufArQ==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulELI-0000000FJ9q-2BKZ
	for linux-mediatek@lists.infradead.org;
	Sun, 10 Aug 2025 22:16:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754864196;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=CioeoXb5/QvchbQJCxl5o+yrQjp6rhhswejt/srDq7A=;
	b=ixCjjzJ4E9bwNP4u/KLETxeLgyn7fYeAJgsZeQZWN8747quOBTLsFt49mhFRs+oHFJkz89
	3WviGbBRZ0sqy0pphFpJU8pOdAQJ4rCkJB0N/zydEHqij4kLHr6vOPiuiJApS5/HFz4Y3B
	BAiVnt0XqJNFRAkbKTSFyo/6QjZMCGs=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754864196;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=CioeoXb5/QvchbQJCxl5o+yrQjp6rhhswejt/srDq7A=;
	b=ixCjjzJ4E9bwNP4u/KLETxeLgyn7fYeAJgsZeQZWN8747quOBTLsFt49mhFRs+oHFJkz89
	3WviGbBRZ0sqy0pphFpJU8pOdAQJ4rCkJB0N/zydEHqij4kLHr6vOPiuiJApS5/HFz4Y3B
	BAiVnt0XqJNFRAkbKTSFyo/6QjZMCGs=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-658-aqVP1Qi9N0OdOmFVnFtmaA-1; Sun, 10 Aug 2025 18:16:35 -0400
X-MC-Unique: aqVP1Qi9N0OdOmFVnFtmaA-1
X-Mimecast-MFC-AGG-ID: aqVP1Qi9N0OdOmFVnFtmaA_1754864194
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4af199d0facso122945251cf.0
        for <linux-mediatek@lists.infradead.org>; Sun, 10 Aug 2025 15:16:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754864194; x=1755468994;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CioeoXb5/QvchbQJCxl5o+yrQjp6rhhswejt/srDq7A=;
        b=VOzweyUsO5ggo4eSvAc/7LWXoYsQTFo2syvAAjxSd3mHSPi7NpKLcw5TF0EMVXvTIZ
         Ep+u9NwQKizI4+4ZYzgswZvxLXJAJcYertOS7eySHDU3vH3SjUv2PE3/bgs4SbK7Wu2e
         PIMcC36eHz4z0hxtKmRIIAvExFwQ+SbhTxNdKUkQ1l05zJUoWVAPIpNPUcHS5r6d0oZo
         TIBqA2deXOfyS43OwiKJ13IjBDjEk2lqKWtMdUoqPxxQvxG4x6iWtL6Um/+s4IAj2Bgf
         GshvrRhFlAT+y2EkmN165Oe12RANVlMPkrVoGAeBfVRO1LGRZq9IAqvb5jVwN8XAqUKx
         YsPg==
X-Forwarded-Encrypted: i=1; AJvYcCUInvx/kHpbwzKL43dhqsMWEajBrpJFxHyOI01V4fRERYvYmgsV3kFSwNhWJ7vAc7WfwsTaQGlfRpg5v82Zdg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5J49pK8RN+pV0pGRxCqi6Jte7P6zpUlk+LCD/n118Zd1JB7zn
	k19ZoLXuwwFVYjmpl+sMXGLpaONyO6KtJ3mEY7L7Z8Q9TUbRwGI/P2I9y2FnQ0oCShNO4G/JwK9
	R3YjkNRg3Qeux2+JeM6qBL4rf5OuNd36uHAai7E6mAZjnq4QLpMBpxjM2v21l6ZMjxDKcv++AFw
	==
X-Gm-Gg: ASbGncsLo2eEJGHzfHMfxWFMC7Ah+AwTXBl3RxYFltqmfQSeO/jzQ+AVsXRUGXTZMUV
	SvnDpHNhT6cZW6ZV2JgVE2/Sl3xOBJKKVmarxg1ID9/1jIg0hlAcyzLIV4Frd/ZEhaUGwiEOQOU
	c/3K/igWXCrWy72wutuPPShWnafuvzyvZ/+hX84FeovgYFVzAr7vr5FpjCPJ50oKDuLdFNBnNMh
	m0GeZRAd0Yo7q+aIMd+PJvXfcFYS27hi5IlUiEDagNF9sCmezZjg94IlSYsQ9M+N0A/Je4FT0iW
	DWkq6oQxhoOhsz/eOz7toUw37MQ3pWjAKUZHBrCnMqniw8nkozwM0BwxM0i5t86aEvkWFltBYhi
	yCfNufw==
X-Received: by 2002:a05:622a:1308:b0:4b0:7775:d342 with SMTP id d75a77b69052e-4b0afddf96bmr142006411cf.12.1754864194353;
        Sun, 10 Aug 2025 15:16:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFMgL2TfTPBpWSj0xTTh5+SfYn/Qjd/HGVOp6AsQdNWXfn2vKbskTIHSYorfqQM8Oa2g6DGMQ==
X-Received: by 2002:a05:622a:1308:b0:4b0:7775:d342 with SMTP id d75a77b69052e-4b0afddf96bmr142005961cf.12.1754864193842;
        Sun, 10 Aug 2025 15:16:33 -0700 (PDT)
Received: from [10.144.145.224] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b06a395932sm92798851cf.38.2025.08.10.15.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Aug 2025 15:16:32 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Sun, 10 Aug 2025 18:16:19 -0400
Subject: [PATCH] pmdomain: mediatek: airoha: convert from round_rate() to
 determine_rate()
MIME-Version: 1.0
Message-Id: <20250810-pmdomain-round-rate-v1-1-1a90dbacdeb6@redhat.com>
X-B4-Tracking: v=1; b=H4sIADIamWgC/x3MMQqAMAxA0atIZgNaFK1XEYfSRM1gK6mKIN7d4
 viG/x9IrMIJhuIB5UuSxJBRlwX41YWFUSgbTGXaqjMW943i5iSgxjMQqjsYPZmZbFN3vreQy11
 5lvu/jtP7fpscdbRlAAAA
X-Change-ID: 20250729-pmdomain-round-rate-cd2fd9417c89
To: Ulf Hansson <ulf.hansson@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754864189; l=5844;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=UYgbTKNNIhZJE5F8ohj4vNnNUmG0W80FAggzMzDyciQ=;
 b=ycuKCsHxlgyIiQDQP/ZXNrrK5TwG59aDdwvTbF9fA5ZaFGS7T11u3eBjUVpg98IPZ0SR0D/LO
 HLq8JMzYEaFDHKAwnSPKYgYnuZw3tWz2CNQiFg0AsRVq8jM/iV/b3Pj
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: IlXC8fYXi_LC59e16_Rvko8lyR-ty7TiXW2sjuReQO4_1754864194
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250810_231640_795944_A117CE11 
X-CRM114-Status: GOOD (  20.03  )
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

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
appended to the "under-the-cut" portion of the patch.

Note that prior to running the Coccinelle,
airoha_cpu_pmdomain_clk_round() was renamed to
airoha_cpu_pmdomain_clk_round_rate().

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
Coccinelle semantic patch is below. It's large and I don't want to
pollute the kernel changelog with the same code hundreds of times,
so that's why it's included under the cut. For subsystems with more
than one patch, I've included it on the cover letter.

    virtual patch

    // Look up the current name of the round_rate function
    @ has_round_rate @
    identifier round_rate_name =~ ".*_round_rate";
    identifier hw_param, rate_param, parent_rate_param;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    	...
    }

    // Rename the route_rate function name to determine_rate()
    @ script:python generate_name depends on has_round_rate @
    round_rate_name << has_round_rate.round_rate_name;
    new_name;
    @@

    coccinelle.new_name = round_rate_name.replace("_round_rate", "_determine_rate")

    // Change rate to req->rate; also change occurrences of 'return XXX'.
    @ chg_rate depends on generate_name @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    identifier ERR =~ "E.*";
    expression E;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    <...
    (
    -return -ERR;
    +return -ERR;
    |
    - return rate_param;
    + return 0;
    |
    - return E;
    + req->rate = E;
    +
    + return 0;
    |
    - rate_param
    + req->rate
    )
    ...>
    }

    // Coccinelle only transforms the first occurrence of the rate parameter
    // Run a second time. FIXME: Is there a better way to do this?
    @ chg_rate2 depends on generate_name @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    <...
    - rate_param
    + req->rate
    ...>
    }

    // Change parent_rate to req->best_parent_rate
    @ chg_parent_rate depends on generate_name @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    <...
    (
    - *parent_rate_param
    + req->best_parent_rate
    |
    - parent_rate_param
    + &req->best_parent_rate
    )
    ...>
    }

    // Convert the function definition from round_rate() to determine_rate()
    @ func_definition depends on chg_rate @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    identifier generate_name.new_name;
    @@

    - long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
    -               unsigned long *parent_rate_param)
    + int new_name(struct clk_hw *hw, struct clk_rate_request *req)
    {
        ...
    }

    // Update the ops from round_rate() to determine_rate()
    @ ops depends on func_definition @
    identifier has_round_rate.round_rate_name;
    identifier generate_name.new_name;
    @@

    {
        ...,
    -   .round_rate = round_rate_name,
    +   .determine_rate = new_name,
        ...,
    }

Note that I used coccinelle 1.2 instead of 1.3 since the newer version
adds unnecessary braces as described in this post.
https://lore.kernel.org/cocci/67642477-5f3e-4b2a-914d-579a54f48cbd@intel.com/
---
 drivers/pmdomain/mediatek/airoha-cpu-pmdomain.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pmdomain/mediatek/airoha-cpu-pmdomain.c b/drivers/pmdomain/mediatek/airoha-cpu-pmdomain.c
index 0fd88d2f9ac29da371590ee3af92c1260e4f2f5f..3b1d202f89dc516922887cdd968c95f5147491f4 100644
--- a/drivers/pmdomain/mediatek/airoha-cpu-pmdomain.c
+++ b/drivers/pmdomain/mediatek/airoha-cpu-pmdomain.c
@@ -21,10 +21,10 @@ struct airoha_cpu_pmdomain_priv {
 	struct generic_pm_domain pd;
 };
 
-static long airoha_cpu_pmdomain_clk_round(struct clk_hw *hw, unsigned long rate,
-					  unsigned long *parent_rate)
+static int airoha_cpu_pmdomain_clk_determine_rate(struct clk_hw *hw,
+						  struct clk_rate_request *req)
 {
-	return rate;
+	return 0;
 }
 
 static unsigned long airoha_cpu_pmdomain_clk_get(struct clk_hw *hw,
@@ -48,7 +48,7 @@ static int airoha_cpu_pmdomain_clk_is_enabled(struct clk_hw *hw)
 static const struct clk_ops airoha_cpu_pmdomain_clk_ops = {
 	.recalc_rate = airoha_cpu_pmdomain_clk_get,
 	.is_enabled = airoha_cpu_pmdomain_clk_is_enabled,
-	.round_rate = airoha_cpu_pmdomain_clk_round,
+	.determine_rate = airoha_cpu_pmdomain_clk_determine_rate,
 };
 
 static int airoha_cpu_pmdomain_set_performance_state(struct generic_pm_domain *domain,

---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250729-pmdomain-round-rate-cd2fd9417c89

Best regards,
-- 
Brian Masney <bmasney@redhat.com>


