Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4114C3DA6E
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Dec 2023 13:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DQDRirBfKKu4jOrue0tUkAqdRYM+XKPGLgDKcTkbvWA=; b=rwRWD3N4LcztxtJ5Y/KIwy2zb4
	8+bxqIr+OrwFKZJW4cg0V1eHE+4uBRgMn25TuFtynKVjTlsyzzNqeIH/515N/NT5Mn+k4LvPYeaPL
	rT3xO72Ux94nKmRdUE4mK4A6uv5dkCQokC1TXCEeY/+PAbeaZ5HaSygUeTsU8O5O0iuQ659u3stma
	KO1OpOVga8Y33vQbx1G26KaCbHRPNQyZVw6RLC+a29yLTlsg2c2dDyIxac2x5hEBFWkpZsaV6RHsJ
	AKBDcZnjtuJA60+Hrs91+smJVl/gLSsQwZoVBBLGqo/5JFYmZOtzZGB4hA6JIEV7EtOGCFPSUsZAZ
	AU/8f1zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rHlQz-00AxOo-2b;
	Mon, 25 Dec 2023 13:55:57 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rHlQw-00AxNo-0F;
	Mon, 25 Dec 2023 13:55:55 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-6d98ce84e18so2219345b3a.3;
        Mon, 25 Dec 2023 05:55:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703512550; x=1704117350; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DQDRirBfKKu4jOrue0tUkAqdRYM+XKPGLgDKcTkbvWA=;
        b=WS/Tml7HoNIJp9LSTBOD61uZxK7o32UGDs547424z1P+57jXMV9ogCiiI5yG40JwD3
         mJEtR4j+EG3cmS5VZthnOXiLFkDqQ43kQmt7zAvrJpYTQBbBLiZllbbRy9e65lLv3cLn
         aBS71kzjPA3caogbMhonBE6Bo76UK9CSTZ/8pF7+0YoGaKkYK4isXikhBoPsX3hvBTlT
         YH807QGX73ijit+WV9ngu3Zcb6QCkn8WiPEM7psqr707WfJG8+nCA2LVE58nrZ2MsiK0
         wHs6nbtrU4Bkh1OI37vVu4Y7izdd0SjLwz8SdLCVAREAKxbd68cD+N0PfeLJikb1DXZ5
         Xrkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703512550; x=1704117350;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DQDRirBfKKu4jOrue0tUkAqdRYM+XKPGLgDKcTkbvWA=;
        b=t0N0XT0kyPxEh/8OWZIsOq0RIBeBIG5VgJyju3c6tQN1aip+T6QM9Gilm2QXVMq9ti
         R820k1L0n5NfzM+GwAq22KB+6KdYUuL8Lz6z2k6L6no18zruirHnwLXjYME8fusY7V9s
         uk2qvdI5dyKkfMyOP65XVszWXExtdKxxdJ229RODWPB5EDAeTOC4GsDzIyB+G1AAUxk3
         sWPk8tO2D+KRmd9Qzbh5U2Rl6Xo+plconhEKS0XSsUlpqCjUCWZmqGG2+L27IRp2Q+A6
         d/X0wn075b9uxCHciEG689KHlzkztLSbEe5/0soSlimNMh1J6t3NPS0lID2x36OW4wqO
         WrAg==
X-Gm-Message-State: AOJu0Yzy2vpgKfKr8HFjr90hRSpFKxe0RdUaZmTC9EDqMgc9Q+/Q9BYT
	AXs1GrhzxHY0uabsKEFZMBo=
X-Google-Smtp-Source: AGHT+IG59G1LSj7Se2+3+49YaCUFtV38BC2bYVSUV4Q/ViyW4rnvflyTan011DTVyVimmqJSzr+AJA==
X-Received: by 2002:a05:6a00:2383:b0:6d9:c201:676b with SMTP id f3-20020a056a00238300b006d9c201676bmr820525pfc.24.1703512550263;
        Mon, 25 Dec 2023 05:55:50 -0800 (PST)
Received: from ruipeng-ThinkCentre-M730e-N010.company.local (014136220210.static.ctinets.com. [14.136.220.210])
        by smtp.gmail.com with ESMTPSA id e8-20020aa78c48000000b006d9b66f3d07sm2300822pfd.95.2023.12.25.05.55.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Dec 2023 05:55:49 -0800 (PST)
From: Ruipeng Qi <ruipengqi7@gmail.com>
To: quic_mojha@quicinc.com
Cc: agross@kernel.org,
	alim.akhtar@samsung.com,
	andersson@kernel.org,
	bmasney@redhat.com,
	conor+dt@kernel.org,
	corbet@lwn.net,
	gpiccoli@igalia.com,
	keescook@chromium.org,
	kernel@quicinc.com,
	kgene@kernel.org,
	konrad.dybcio@linaro.org,
	krzysztof.kozlowski+dt@linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-remoteproc@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	mathieu.poirier@linaro.org,
	matthias.bgg@gmail.com,
	nm@ti.com,
	robh+dt@kernel.org,
	tony.luck@intel.com,
	vigneshr@ti.com,
	qiruipeng@lixiang.com
Subject: RESEND: Re: [Patch v6 03/12] docs: qcom: Add qualcomm minidump guide
Date: Mon, 25 Dec 2023 21:55:42 +0800
Message-Id: <20231225135542.1789-1-ruipengqi7@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <1700864395-1479-4-git-send-email-quic_mojha@quicinc.com>
References: <1700864395-1479-4-git-send-email-quic_mojha@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231225_055554_141547_2063F211 
X-CRM114-Status: UNSURE (   6.85  )
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

<+How a kernel client driver can register region with minidump
<+------------------------------------------------------------
<+
<+Client driver can use ``qcom_minidump_region_register`` API's to register
<+and ``qcom_minidump_region_unregister`` to unregister their region from
<+minidump driver.
<+
<+Client needs to fill their region by filling ``qcom_minidump_region``
<+structure object which consists of the region name, region's virtual
<+and physical address and its size.

Hi, Mukesh, wish you a good holiday :)

I have the following idea, please help me to assess whether this can be
implemented or not. As we all know, most of the kernel objects are
allocated by the slab sub-system.I wonder if we can dump all memory
keeped by the slab sub-system? If so,  we got most of the kernel objects
which will be helpful to fix problems when we run with system issues.

How can we do this? From the description above, I think we should
register one region for each slab,  for each slab will have some pages,
and the memory between each slab is non-continuous. As we all
know, there are millions of slabs in the system, so if we dump slabs
in this way, it will introduce a heavy overhead.

I am not very familiar with qualcomm minidump, maybe my thought
is wrong. Looking forward to your reply!

Best Regards
Ruipeng

