Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E08BC3DA6E
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Dec 2023 13:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DQDRirBfKKu4jOrue0tUkAqdRYM+XKPGLgDKcTkbvWA=; b=i4otj4hXoAoM69kmz4Mh447oTt
	4r4HoWhnThIqeT00rNfduowIGpb0M0PV+r/z8Z7BWyuwsYTXmrs5CNxanPN8Q7Iu492e/f4RGwuEo
	pLJfsx3mVBpzoOEEUEMyLUV7jsJIDJxuWEOAwDtaZaHx0IrYz2S3JYXJIBX5Enbav1J4eyDCciZfc
	AoOngT0qwdXyQ16sG9jMSzhoRz+3IBPY3vgE/5GnOecxc55kBVF7TjpXU5OkgZu9C12g1q+qF+dj1
	tMsPXxfntRF4Wa8JXl/tZVz7nBIAV+AjtCNPmaS1KLXnGN5+6NqAntIvo0xZl+wDVVC5/kpJ4gKMQ
	UsQi/iHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rHlNJ-00Ax9M-1O;
	Mon, 25 Dec 2023 13:52:09 +0000
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rHlNF-00Ax8a-1K;
	Mon, 25 Dec 2023 13:52:06 +0000
Received: by mail-io1-xd2c.google.com with SMTP id ca18e2360f4ac-7b7fe0ae57bso226478039f.0;
        Mon, 25 Dec 2023 05:52:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703512321; x=1704117121; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DQDRirBfKKu4jOrue0tUkAqdRYM+XKPGLgDKcTkbvWA=;
        b=JoDE4Fjnzh+WrU/m2LwQ5WyrHPDriidWe2ow5JDRBzwdgOi/mt/P9+87NV0JdtQABi
         qBnw0pWGzD6MBCuT2s/c3IYHjkO2hTTtA16HwYmNjaP3VVlUnKUl3P/7tOjnT7km63ax
         dITu1z+eY2MTHcW0PViPTBT6855CJmLdnHpYOjshVLNiYK+kIU+pF3sIWWE0nmM9IInu
         g8TeJELlH9UhhwKOtPXpfCSKj7x0n4YJULAt0I1Ek1DBxjVa1E+aNCridGIYcEdOc84h
         ury8tAPFeBGkmYsC91cic8Qo9p0t1iE2PYgAlaZ8ET/84Fl45hfTT2JifLtay8pTaksi
         kTvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703512321; x=1704117121;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DQDRirBfKKu4jOrue0tUkAqdRYM+XKPGLgDKcTkbvWA=;
        b=rYtfTK1BfbXdeOqk/iLdKZMvrF9Etn2ogsu8mn9u0gmffkGY7R12e6EpIf20xF48pI
         vezCKg79YQcsgL6t1Y/E1QcioAquwWy3wwFaIBWL3nJ+NTjSFgcbs1etb6H7u9mZggsX
         j9COkpaMhn6gGfjx5GaXKAy6CPd0/4pe0bgmsXOUjtg3G98Z8TmWcwXm2lMXnuAg6BfM
         jApyJsWJnabk8ZGXpsH/K4eblWwUzieHUHVhu+NxWIy0j0eP9B/KDpN5yYOhisBmZiF7
         NgRH+F3TPCU40gHENX6wkFoP1IWEi4duMrFXvo4O5IlaXiYoVhEJbVo+ggnBk7ux8dM3
         CDOg==
X-Gm-Message-State: AOJu0YxI1R4SXNF8tk68loljcOUzx9cxuO4j1h0RHVftfxGEhvrtsU31
	+Qiq6tTNBZPMqtFbJaM2RgifhUqRFaXeEQ==
X-Google-Smtp-Source: AGHT+IEYgLF09i/9I2s+ydOWQU4ZE4IGPKPqYKOFoFRWMaYWMfy6iMab7ptoQkzUq/hKh7U7yFYQVQ==
X-Received: by 2002:a6b:5a15:0:b0:7ba:b0d7:20e5 with SMTP id o21-20020a6b5a15000000b007bab0d720e5mr6741671iob.0.1703512321676;
        Mon, 25 Dec 2023 05:52:01 -0800 (PST)
Received: from ruipeng-ThinkCentre-M730e-N010.company.local (014136220210.static.ctinets.com. [14.136.220.210])
        by smtp.gmail.com with ESMTPSA id k4-20020aa792c4000000b006ce5da5956csm8002767pfa.24.2023.12.25.05.51.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Dec 2023 05:52:01 -0800 (PST)
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
Date: Mon, 25 Dec 2023 21:51:53 +0800
Message-Id: <20231225135153.1408-1-ruipengqi7@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <in-reply-to=1700864395-1479-4-git-send-email-quic_mojha@quicinc.com>
References: <in-reply-to=1700864395-1479-4-git-send-email-quic_mojha@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231225_055205_472440_895C56FC 
X-CRM114-Status: UNSURE (   6.89  )
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

