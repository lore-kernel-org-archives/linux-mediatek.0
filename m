Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 407B8C5AC7C
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Aug 2026 07:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1raNmBEOmz6ZINnfoRbXmauBepPzo7RH3URyysnOXJI=; b=e2Ts+AaOZtK8SxfS+M7szJUvem
	ZsJ5kq1dsPG5VMxasGDdW0GWvXjzBMwSTIPtR4OZ9A+eX47UuiLofbqP9W28b310vAQl5GksPyS6s
	5K3ZAUCB/HQDKPTjiR0vStA06NaksuW8LXJIY7Eqh2rX2gJ6UQJPNvrS86SdOkQ5200mB8KAvbWXC
	dbatFhL7oiv8+brDqMbrTfECbqpmHeLyN71Wrfv0iklf5cQSBXBZwSNutltsA8qHLARkdjYzveXnK
	0Ks7C96L+fQ726XbBXk4wW407XFC2sE2LKnUm3fHbcSoZ2slwpQ4suEcHLTAdcetP2oRkPyck+fr7
	+PJzHVrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsEz9-00000007EvP-1V3u;
	Fri, 07 Aug 2026 07:27:19 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsEz5-00000007EuA-3qJm
	for linux-mediatek@lists.infradead.org;
	Fri, 07 Aug 2026 07:27:17 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-5aec201b582so3055965e87.1
        for <linux-mediatek@lists.infradead.org>; Fri, 07 Aug 2026 00:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786087634; x=1786692434; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1raNmBEOmz6ZINnfoRbXmauBepPzo7RH3URyysnOXJI=;
        b=GK/MUU+12YOdudd+IeMPJtVWnEORCsCNXxCv7g8DtSp+rmO/X767dF6OmxQT0F44Yv
         WRjILbari8v/mX1IRCdNwy0sU7QpYAM+uEc0m0RNDUkCgXVNYJyuu6a87A5GJaKMivuP
         HVk67V0GPRUmWgv4zTLYO/8/zVcMpUXPmDbm7fyWHPnQNAl+f2R3bGwvzMp125GNZw3M
         9trNgtFNEhuegMOL4sFqkaKScQuonWu6JvW2jv6Yl5WQ4SMICHVsZuA7syFAY7nhgOEO
         xm2UTWu8teTYg0TMU0FZqZ54+NYOGrhHbUw+5cNVM+penSfeTLcRYJqLPM5AggNHP1iI
         qyxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786087634; x=1786692434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1raNmBEOmz6ZINnfoRbXmauBepPzo7RH3URyysnOXJI=;
        b=OUyQC8yHX0Zu7R6zyFkEFj6EYok6qAkMeSA6RgNi4PTPHLl1hxXY6QFkjaGB/w89Uc
         LJGJoO5R2TOb6b+K02x8o6u4mRbPdBuAx8mC9OShMsmUqFI0DwNY+qfjqjT5NDh1Bdb3
         rfOj9u3/ffl8+RpVyILsO9krJ9MYl3eHZwHabRMQZnpZ2gGg3q1IrNRYj3kkOi3lWgEM
         uxIhL18XvUaiwCzT2OMUK/B1Ks0IIsFKRu+LjR49ylk8gXQbrJ9abXmlX4vfVISL+qJF
         jqE77HdexWhcRCBs+o5q+v7QUo7rt1loD7rgQ6N+O5p0jvmdjDQqtxKFV+OJoFz6P7wU
         OQjg==
X-Forwarded-Encrypted: i=1; AHgh+RqefvNSdPG46ysVsLvtNshe1IXMxDQtNDqsZXlHXm4qanyUh8pyrRd4eoJ6rxD8Ebgul5Q7sd70cSjcWM8eIw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxn1SnoRRh9CzUcOkzF9djbkiwLxJWpm0y5rU4vzGWFPwDe+hqz
	6bhSDGJ2GFUt/FjTkCFRUwcvWQ+h7VrqpRC474oa7u31ObGaiUeYvsQ=
X-Gm-Gg: AR+sD11pLF/N4ySQFGUgFrfmIE+ZgETuVG5rB+Wm2eXnFp3UmgKYdrNJK3wEHGTDuLq
	MmFizzyxcP8rHs2r81jfX8pK1JBIJRsYN1YJ8uzRDO+NbGJSsFSocaq7jd0sqQo3F2AGtIvSwqr
	AV6NBWMEI0wJNOt6Oa4V/pLD9rzgpyDTw3AlL7p+Ia9NBK/hr4bz5rN5/+HJrUheO+zx7hSHlhK
	RUhNizoOWmxcynzrJU/xbISXfnvhnj3G1Nf6s4uh8Pgpit5xuHeMLa9SUe8zE3offMCmEqSn7AL
	2QVf/KC5+zTvZZwQ4rF7BXtnoye7yAdZWE7PuJNWeGij2ukWxBmqM4/1QQjMvmOmi89uy0rP1B4
	N0gR0AC2YLgAsKmmLtwvF4ixdl/g0NOqlF6e5jLSA9HYGABCoSErE431kzEG2mW/DqTP9j61jj3
	Km40fO76BpWAEtmsdcCgShff9+IUpwHwJBDV3vrD//QqJMwETsdCY=
X-Received: by 2002:a05:6512:3a93:b0:5b2:a21a:10e7 with SMTP id 2adb3069b0e04-5b2f4ccb4aemr2641992e87.25.1786087633471;
        Fri, 07 Aug 2026 00:27:13 -0700 (PDT)
Received: from fedora ([46.8.219.5])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b3055f1cb0sm317139e87.64.2026.08.07.00.27.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 00:27:12 -0700 (PDT)
From: Vitaliy Sochnev <sochnev.v.74@gmail.com>
To: lorenzo@kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] net: airoha: npu: load the firmware without the sysfs fallback
Date: Fri,  7 Aug 2026 10:25:30 +0100
Message-ID: <20260807092530.46853-1-sochnev.v.74@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260807024125.434055-1-sochnev.v.74@gmail.com>
References: <20260807024125.434055-1-sochnev.v.74@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_002715_958602_4C32AF22 
X-CRM114-Status: UNSURE (   9.14  )
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

On Fri,  7 Aug 2026 03:41:08 +0100, Vitaliy Sochnev wrote:
> request_firmware_direct() sets FW_OPT_NOFALLBACK_SYSFS, so a missing file
> is reported as -ENOENT whatever the firmware loader is configured to do,
> and the deferred probe path works as it was meant to.

Prior art I was not aware of when I sent this. Ziyang Huang described the
same failure and proposed the same fix for OpenWrt's copy of the driver in
March 2026:

  https://github.com/openwrt/openwrt/pull/22697

That one predates the refactor which folded the two request_firmware()
call sites into airoha_npu_load_firmware(), so it changes two lines rather
than one, and it was never sent here. The reasoning matches what I arrived
at independently, down to LEDS_LP55XX_COMMON being what selects the symbol
back on.

Recording it here rather than leaving it to be found later. If you would
like it in the commit message, I will send a v2 with a Link: tag.

Thanks,
Vitaliy

