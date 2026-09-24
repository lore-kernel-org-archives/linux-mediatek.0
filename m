Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE4ACC9830D
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Sep 2026 03:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IDWUGgI7HoAY5EzKTrGu9KmV8B6UKqlPrugtC1LIObw=; b=Peai4B5YshEqVkFs+kCptRqXWC
	rSYTEjay3m4j/aLCnm3wdyZCDV0Qm83nmujUug5s6Xo+mDb3gvcT0ZfWlX4sSUu5hjqonCSfvzkiw
	e8WAxJNJJUgHgpJFTlANODumLDq81/s05fI1Goex3qk31ekXn28mx/xg1j4Csg99AJ0LZEiYQAZXG
	R4PzaSOHXX4XzlxkMqelOgyO0EkVN597ZqieNc7IvEDLSgctJVRp1iv69ft2rJehUjxbG9AnHgu1B
	m5BsfkhCQsIU+BJb+ELbno8eHyHSFKWPzd2T6K9KsbVcKXq9nilQs6jhJDigyL1NsQdU5NGl+HxPy
	Juc/fUAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9a7s-00000009wMc-1JNe;
	Thu, 24 Sep 2026 03:28:00 +0000
Received: from mail-vs2-x0f.google.com ([2a00:1450:4864:3a::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9a7o-00000009wL9-1APP
	for linux-mediatek@lists.infradead.org;
	Thu, 24 Sep 2026 03:27:57 +0000
Received: by mail-vs2-x0f.google.com with SMTP id 71dfb90a1353d-5c83be8db39so1037244e0c.3
        for <linux-mediatek@lists.infradead.org>; Wed, 23 Sep 2026 20:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790220474; x=1790825274; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IDWUGgI7HoAY5EzKTrGu9KmV8B6UKqlPrugtC1LIObw=;
        b=fxElRtGEjOSJUdSkJSwK295kKJg1cMBaYLOluEXPZcehcSMHjaZjzvyGslW+QuQWb1
         x1EbLThC9H3y7iDuQyFwFm5nAZrh5/YIba0LQ1j7TzhNSim1/IKW2rs8aC+HXlCIdCaE
         dTjn+8W11b6AKJH2+RqFFJpMhCuJj9IJj2AW5eFImpRHP+bSPEXHQyTVmcOCSjbwYBjO
         aAXU45KBvINsIj1XHdlFT6jyBgiAiZssjPPuFe/mfPuB01yd5tfG9Ml7iqFCoDXSYlWs
         K+H6rDnXS9f1exyCCRTnEHTqXmcvIC1YGkOAj7WhnPlThWPeehkhLW5EzHJ7tYH0GFuO
         Z5MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790220474; x=1790825274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IDWUGgI7HoAY5EzKTrGu9KmV8B6UKqlPrugtC1LIObw=;
        b=cWfAV8wzaFMFTG2z5yC2t9weLsLTWcuD1bxMe71TTnu8fM4t3rTs/Oj8UYSVSaa9MU
         YE4Uxty7uKpFrdQkAM4dAOAvbYDpiZ1qIKAm1vkH8jDeBv5D1BSac1QjlWB9kj5mBDoM
         E8ANBgPvIvEiLoO6fbb0/W87mdpP8gSt1nnXs24emCQaNwdzmGUfctdGJ+CeDbAf/iZL
         ClAasAWsF5z3ij1fHYQ3N9LDbv6Sq2wQA7va6M1M695j6kUmCzBoeHNtWWYmGtOoAnuA
         X5nQtTAC3ujrAp7kotOKO9rzZQHA7quxCnJnHncgCsYOjd9T9ixyBJjzelFlTE7mRB5j
         cM+Q==
X-Forwarded-Encrypted: i=1; AKwUvByRui1eHJWCM99iE6lUHjv+Fkryply/44FSnP9t6AnzeMd8eVvJUMsXtlhk109gZEz6TMEX92dlARITvrC3OQ==@lists.infradead.org
X-Gm-Message-State: AFuF++miL63HiS6zBTFPHr+JW79w11CUWA8TaiuDpX1V/8avuQSsQVIi
	ZqVlq5JtAmvAYvb9iwAEQkcvoUSadl/dci5Km7niGuIzLae9FE4+M60/
X-Gm-Gg: AYBFou0qSw4Y3aVSKrkkA0JCthCph3z9MNJ4vwZUOthrOjqCZjjupJnePuFxx4XcCKL
	mSjbUCrav63xbmyGiZyMIwGATkuoYRjFJ2O67UVLFaAtYJykLAGIgN3+dtG77fuuBLxrFcGnpkU
	TOO9HOfAXrPbsAqOorgAMibnFznsReu6E/joZexXLb7Az+GpDy0o5tl+LqNPoVr69XPrGxAoesQ
	Vnv04QGseBngkTZ4pfH7zRPAU9Y0MytrBDnTpYhx98w9gbT17oUEijaLV73h9z6iSHGNl4wfRfp
	j4orhw8npKsLyUT/ZopnCbroENs67nANCaLwLFCYGt2vpr9/TP2Ff+4YROZtmjFRT3rooX7JyXo
	O4HaVR+2qTFl1EKe2oEYLPzCqoEgTbIaXpfoFEyvpL+i7e6ocSWxTrfnP69dabE8uu6bke3EI0Z
	ZR71XOaCzNHq4GRp0svoPYFA1s/8Tw5B5+h0VFrOlMiuhoOL4bScIno9hCDpnNmEzA1BjvIGIEq
	x/HF5p9e6mPxVd39W/zDQvoORk21NJfBjTPNLYQs4W2gK8=
X-Received: by 2002:a05:6122:17a7:b0:5c9:a60c:2738 with SMTP id 71dfb90a1353d-5cb0ba6895cmr877405e0c.16.1790220474422;
        Wed, 23 Sep 2026 20:27:54 -0700 (PDT)
Received: from localhost.localdomain ([190.177.169.131])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c9f0551688sm5152866e0c.15.2026.09.23.20.27.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 20:27:53 -0700 (PDT)
From: Cristian Papa <pcristian292@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: nbd@nbd.name,
	lorenzo@kernel.org,
	ryder.lee@mediatek.com,
	shayne.chen@mediatek.com,
	sean.wang@mediatek.com,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] wifi: mt76: mt7603: initialize global station WCID
Date: Thu, 24 Sep 2026 00:27:51 -0300
Message-ID: <20260924032751.28278-1-pcristian292@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260904010702.16306-1-pcristian292@gmail.com>
References: <20260904010702.16306-1-pcristian292@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_202756_349871_CCE94CDC 
X-CRM114-Status: UNSURE (   6.40  )
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

Hi,

Gentle ping on this one: the oops is still there in mt76.git at
be5ce79105 and in wireless-next at 10cfa109c880.

Another Archer XR500v owner (NetviperZ) hit the same oops with
aireplay-ng -9 on the 2.4 GHz radio and confirmed that this patch fixes
it, and I have repeated the injection test on top of be5ce79105: the
frames go out and complete, with no oops.

Thanks,
Cristian

