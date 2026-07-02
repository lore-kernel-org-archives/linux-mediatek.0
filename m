Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0AF5C43458
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jul 2026 06:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p+AybXHCcO4BnLqFoauWvt1KwEn7CeMrNml46vf7sfE=; b=WaYA5v/QTR87D5k6YyLZlJ9VvO
	/XBgOJfV/yFW1ogLXO7zTFsNU/YPYGWvseusywOsOOxfOG/fKECyjZjHtsqPR/oenPIXgxvAoC022
	bP+3rg3oYNwC1YMyIzfY90Y8eeetmdHwQWEPC3GB8rpeawwB5kVt/8NpYOnK8+M3hFlIKYXrF3JaA
	sxNiNlyT/XHObtHo7jkOTyyBiayOL0q0efJrWl4vS8jDohN3bS5WPUP1MZrpjwKfZ5v8o5+6BA4/I
	sdEsuDQOPe73NZ7rirJ7Rh1hIelqNfVwWJv4kHVSUw4MzqErIDkBhpnwe0XUJrvrVCCbiAgbOVyIL
	aXxA14pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfAoD-00000003dia-0nwQ;
	Thu, 02 Jul 2026 06:22:01 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfAoA-00000003dhX-3hv1
	for linux-mediatek@lists.infradead.org;
	Thu, 02 Jul 2026 06:22:00 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2c9e9a8af98so9513465ad.0
        for <linux-mediatek@lists.infradead.org>; Wed, 01 Jul 2026 23:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782973318; x=1783578118; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p+AybXHCcO4BnLqFoauWvt1KwEn7CeMrNml46vf7sfE=;
        b=apj9L6d5S2YRb+IAxYFaXvqBlcRbg4vv91sB/11yPEfheBDe+ZwCnBfphh4UoFU6dR
         rVJ7oztbPNuJLskIp6g1Bjhcq1r1vRkZ3+3BHlkfGv08hlOEHYkQCNy/t1rHr+NJFMYe
         TqD0E9Q5vbj5ax6FjrPdUyhNu+hXh38XjVcw5KQ4Sq7jXnSGzx64QEXtba/tlVg3DuGN
         Hm7+Obpj5Dd2/ChTALi1qidLbDM5E28+6RMCcvtPbiPIUGIClqTXVlQhNuolArOtGdnd
         tPO3910CZ1FmetzteB3rxG4HwWsFhNYW3I6UGf1trriDaW7IfXYPksON4GbFuAe7sZAH
         9x9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782973318; x=1783578118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p+AybXHCcO4BnLqFoauWvt1KwEn7CeMrNml46vf7sfE=;
        b=jZ699y/HGaduXR7gmGmuvdew1Xy+i96I72ewSp9sjXJgAimzji19NRNLH3wFaWEEGT
         PuBXfMiaskyW1qDUGxnXwPwvGRe8AAfdiAhq+t2UNgPRyouO19OPVIreRsCz+KTPvjBE
         xHo1Z5cVXnXtU0MA6laoRPMunIUos5JwbrVRXIeXK4Rq0IXw5kk/LQBZmjSVeeBas8uA
         3FtVfyRaUCE6ZfEicUN3Ek5G6zgfG53z310wnw6sx8Vjym9kJvJi9QLRMSlLKUdy/ELS
         wEgZOdoDaG/7VRgPqWVzlaRPTfBsnl9yrl/rrUS7HdVuICOq3fSWOv2JWKdY54+huxlw
         wIkg==
X-Forwarded-Encrypted: i=1; AHgh+RrvFuhLnPfCUYTHEsj5KWNRaWVzgiyXZ8uEUESfki+vnsPOnJIKrUOD9DUm349zk9ua1Vutf2VMzD8Qg1Fprg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxj8EKfx6BEQN12TgZMnqeig43VrIpjK2jWeemkomBg2meRQaxg
	tljVgPe92R9ulZpEAasUoQdlXTL/HYiwyJvrwRfqaJpKFyiQfiRGPCKE
X-Gm-Gg: AfdE7cnapkLQ/KHDD5qxw3QdZ8v4Rb1rYJhjYiR6PCgHfSz3WrZJNjkNoA1TNb4Ox8j
	mCnY8a06CV1xyB/3XNvr896vLwxgzdkIpMfp17EKdoQSGeUxvp6UUjr2Ezd3Jv0v04TYuDN/ydv
	iJdqvRYHFfTUx2jeIUXbnLhPT6iSoclhliedwby13S/CHk0ngUpkvMKEuzr1ne+u5FT4jKq30ox
	FhglZzAyAQtZMk9YT8aDtpA6ovWEp2EYz+igm7LkgALy1CkBzWMgKZjmr2J5OdLkJWWWc2Hpd09
	Dqiv1E9pPbrI4XoLj1ZRjp+sytjoZscvlJBbxlzpbA93GQgZbhdD9XXpyjO9dyeBqcXorD9qKLl
	9GZvw2V6DtrQ1Z0kPto9PD3vldpHWQvCBs9x5mRBEYRKr40B0HSXS1m4V27GkkcSns4oXhVsJDi
	JcSSnF6MLI85EWf2+Ng+sKipUT0MEGxI/9cQ==
X-Received: by 2002:a17:903:41c7:b0:2c9:c46b:129b with SMTP id d9443c01a7336-2ca7e67c028mr50539785ad.5.1782973317756;
        Wed, 01 Jul 2026 23:21:57 -0700 (PDT)
Received: from nbai25050028.. ([2403:8600:2090:6f:cce5:6a06:d746:c95f])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7fa65asm5296145c88.6.2026.07.01.23.21.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 23:21:57 -0700 (PDT)
From: Aniket Negi <aniket.negi03@gmail.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	aniket.negi@airoha.com
Subject: Re: [PATCH net v2] net: airoha: fix MIB stats collection to be lossless
Date: Thu,  2 Jul 2026 11:51:47 +0530
Message-ID: <20260702062150.8291-1-aniket.negi03@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <akWYEf5wusTq9_ol@lore-desk>
References: <akWYEf5wusTq9_ol@lore-desk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_232158_942186_83898683 
X-CRM114-Status: GOOD (  10.08  )
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

> > Signed-off-by: Aniket Negi <aniket.negi03@gmail.com>
> 
> Hi Aniket,
> 
> just few nits inline. Fixing them:
> 
> Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>
> 

Ok sure. I'll update.

> > +	dev->stats.mib_prev.tx_runt_cnt = val;
> > +
> > +	/* tx_len[0]: RUNT (32-bit, delta) + E64 (64-bit, absolute) → {0, 64} bucket.
> > +	 * Accumulate RUNT delta in tx_runt_accum64, then assign tx_len[0] as
> > +	 * accum + E64_abs so each call gives the correct combined total.
> > +	 */
> 
> no new-line here.
> 
> > +
> > +	dev->stats.tx_len[i] = dev->stats.mib_prev.tx_runt_accum64;
> 

Sure, You are reffering to both the spaces above and below comment section?. Same for rx_runt and rx_long/tx_long.

I'll update as following:
 +	dev->stats.mib_prev.tx_runt_cnt = val;
 +	/* tx_len[0]: RUNT (32-bit, delta) + E64 (64-bit, absolute) → {0, 64} bucket.
 +	 * Accumulate RUNT delta in tx_runt_accum64, then assign tx_len[0] as
 +	 * accum + E64_abs so each call gives the correct combined total.
 +	 */
 +	dev->stats.tx_len[i] = dev->stats.mib_prev.tx_runt_accum64;

> > +		u32 tx_drops;
> > +		u32 tx_broadcast;
> > +		u32 tx_multicast;
> > +		u32 tx_runt_cnt;
> 
> 		u32 tx_runt;
> 
> > +		u32 tx_long_cnt;
> 
> 		u32 tx_long;
> 
> > +		u64 tx_runt_accum64;
> 
> 		64 tx_runt64;
> 
> > +		u32 rx_drops;
> > +		u32 rx_broadcast;
> > +		u32 rx_multicast;
> > +		u32 rx_errors;
> > +		u32 rx_crc_error;
> > +		u32 rx_over_errors;
> > +		u32 rx_fragment;
> > +		u32 rx_jabber;
> > +		u32 rx_runt_cnt;
> 
> 		u32 rx_runt;
> 
> > +		u32 rx_long_cnt;
> 
> 		u32 rx_long;
> 
> > +		u64 rx_runt_accum64;
> 
> 		u64 rx_runt64;
> 
> > +	} mib_prev;
> >  };

Acked the change name from tx_runt_cnt to tx_run, tx_long_cnt to tx_long, tx_runt_accum64 to tx_runt64. Same for rx counters.

Best Regards,
Aniket Negi

