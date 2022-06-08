Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 614AEC43334
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jun 2022 09:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Epfpr2ty6izm3FlbAT8QB3hVMSQ3pBZgM3XP9gqbDWg=; b=HD6YAdJoB0d2Ew
	fqeS3UP8FxkfS0fnqR2nZuOvH0ArCG8/iH4CHqqI0Cmk2HK9sZfk7RHETG4nL7gw0r8yJLZyPYIeJ
	wqGeazzmWVAggK08nXpY4B/9qUHbeCy40FwJHnFkZyYuL3JGM5uGcgQkTKT955ubkSmF8Y04gNKzo
	Q+9UpKEH9PZz9NeujZ2GZJdY0lu22HLuZER2K/CU6BOVEUwCv4IX64tTkyzKhQuz2vruz8BVDo9b8
	M4ohDfqh07AriGRtzqI8pkMKuwSr7rRQxetGdnHf4ZaGSaZpzHIHJ76kvz8pEFJu/jCfmB3p0B06q
	SgLmoAanuR93BcxVx3Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nys3i-00COgP-8S; Wed, 08 Jun 2022 09:33:02 +0000
Received: from mail-oa1-f45.google.com ([209.85.160.45])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nys3e-00COe8-W1
	for linux-mediatek@lists.infradead.org; Wed, 08 Jun 2022 09:33:00 +0000
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-e5e433d66dso26474132fac.5
        for <linux-mediatek@lists.infradead.org>; Wed, 08 Jun 2022 02:32:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=8q0UkAZ4dvNknvTQvko17+mn/F0IPrhf3ct/EHs1tCQ=;
        b=KKz3H5fzl67PFofguNpcb213WbzUgml2jRgudUJFKm318q/eZyKtFJTGVuI8rVutkV
         NZ0AodqByMLc4Qn6U77OxnVEKnFzCwQ4afwXdqmwLGdVrUWvj4q6LHM0NVkcOIX9AMr0
         qfrI46GkwHfloeOgDXTVlGYu2k/CeqiW9/ZfaYdVvOs1rPwYnijYATsfnytSG8wfBoDE
         dDLleMpO+ySi09Kk0LKa5D/G/PRh+vkPgHGAHOhFFu5WsYT7q72KMqPc7TjgoOypgbSu
         jOyXJNDyVtHm2hKMY0RhyRyJDTcVgXhU6BYXgmt6JyPVEKb9syQQxqAMUqas2IhApWlC
         OOlQ==
X-Gm-Message-State: AOAM530H9XCIEKmspJT0VjqOJif4W3NRtNzpfSRZzabr6pChQQgdMaGO
	pLGXCLZCwWAst0wG8UlDwAbyrwAtYvWQNMVE/qo=
X-Google-Smtp-Source: ABdhPJzDC4rfQ2h72frt9dZYgo7p6s/mGWoR9neFT1AICp5chVHIamtKDi4iNqVMNjw1NMwuzyXGfA==
X-Received: by 2002:a17:90b:3a90:b0:1e6:a203:c7dd with SMTP id om16-20020a17090b3a9000b001e6a203c7ddmr31913271pjb.144.1654680766972;
        Wed, 08 Jun 2022 02:32:46 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net. [71.197.186.152])
        by smtp.gmail.com with ESMTPSA id s2-20020a17090a1c0200b001dcf49d92a1sm13623279pjs.28.2022.06.08.02.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jun 2022 02:32:46 -0700 (PDT)
From: Kevin Hilman <khilman@kernel.org>
To: Johnson Wang <johnson.wang@mediatek.com>, cw00.choi@samsung.com,
 krzk+dt@kernel.org, robh+dt@kernel.org, kyungmin.park@samsung.com
Cc: djakov@kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 jia-wei.chang@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com, Johnson Wang
 <johnson.wang@mediatek.com>
Subject: Re: [PATCH v7 0/2] Introduce MediaTek CCI devfreq driver
In-Reply-To: <20220607140556.6278-1-johnson.wang@mediatek.com>
References: <20220607140556.6278-1-johnson.wang@mediatek.com>
Date: Wed, 08 Jun 2022 02:32:45 -0700
Message-ID: <7hr13z7b5u.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220608_023259_081296_EFDD3154 
X-CRM114-Status: UNSURE (   5.36  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Johnson Wang <johnson.wang@mediatek.com> writes:

> The Cache Coherent Interconnect (CCI) is the management of cache
> coherency by hardware. CCI DEVFREQ is DVFS driver for power saving by
> scaling clock frequency and supply voltage of CCI. CCI uses the same
> input clock source and power rail as LITTLE CPUs on Mediatek SoCs.

Tested-by: Kevin Hilman <khilman@baylibre.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
