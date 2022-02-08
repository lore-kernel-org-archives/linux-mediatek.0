Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 633DBC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Feb 2022 08:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UrOTH9rkznchYsn/GxKUfCk9n9W/iAUEj2kzX3gj3nA=; b=YJqQzyuVxFgZtR
	JmcYFh9V5orXt1TZLW5hrxqhZ8cdKEsIa6lFZbL90oqaPim+hDqsUuWS4jbdJ8CwbZpCQeQwNb9aR
	dhuOB6hp3d0E4haDanyyCcAZFdgS7w9vBlOhbCTPt4YyhoAMN0Uq6cxNC2x8PbEotEamMw1tnsIlh
	u3HDw0yGUVfvJNoP9+10dfqaYfJz0fYy9piYQ3xXV+33ddr1YQUa/akAONnMcT3B+j9iA1Pju0Qyf
	ZTs8KNDwuEa9SJwOVs2RSkgjCHa7a26tsS+sgZ6uOM2+gfm00v9h6KJ8A/Klv0L7TnIXccMM4WtdO
	jR+cqVbHaCIxXaDDdp2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHLtI-00CyXd-8G; Tue, 08 Feb 2022 08:30:24 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHLtE-00CyVd-I5
 for linux-mediatek@lists.infradead.org; Tue, 08 Feb 2022 08:30:22 +0000
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 6C03C3F33A
 for <linux-mediatek@lists.infradead.org>; Tue,  8 Feb 2022 08:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1644309017;
 bh=31c7s2vA8m7YEf6YWOkMfxDEdxn1Te+1H5YnjylA44k=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version:Content-Type;
 b=OGZb2teiUUDBOxsxCAbFbKVtyXYjSbO+DMOWhxCLR4nMjQ2TzScNc+ysoHo20Ye7r
 ipzvCVDHAfQWg63eM7/LMEziemhhHrel8bkkzxFNY+BsUxOmuyS+sH70H363u9KlzR
 qnr2DyUabzxwXm2cCb4AJ/5akAJk4YZgtY/3nwXE4FGCuzyXf48m1PN+anJeX+WMpZ
 DXHhpBBo7mAaWphxETu6IA7k+erdk/j7TdGSo1a+Piz/NpySXbLw+DuPz7U+2Vu7Bc
 LFtVqQFKLVS4nVI1vESf8Rvn500+LZ76UL0I4akNcmQP4NV793cVhp+jl4BAPAuJvi
 vH09vwaH14PbA==
Received: by mail-ej1-f69.google.com with SMTP id
 l18-20020a1709063d3200b006a93f7d4941so5417166ejf.1
 for <linux-mediatek@lists.infradead.org>; Tue, 08 Feb 2022 00:30:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=31c7s2vA8m7YEf6YWOkMfxDEdxn1Te+1H5YnjylA44k=;
 b=HB1Du78eUn6gNngO8sGZalPyxe6N5AtNYVQaArsErSvCeLD2reNDdM0bAAWOQAwhEp
 f7B3mgQxFLa2vwYeKTfAr9OHUDBU+jEcl/HeDKP31bb6f6KfXq3A4whRUuyG0Dsc5oBX
 CpsK0FLeMmN+GaucmRksFm7YjDl6RojL5gnmU4SSX/mgYZXp71GCNQiuk/ZtieZ0JBaN
 rXLLYqBUkOmv0ZdglIbiJsBYSo8Adtq+TZqQ6C2tx4QZz0MeV6dNLe4hxTouR4jjLMCh
 GjEVmsAYjpFS7CPZ9oxCKl9fkyqHpTIf0OgeCid2K4ypA9E8GAyTGBHeFUzh+NhDToD2
 kH7Q==
X-Gm-Message-State: AOAM53098Sf57Fa90hL79R433CsK2o5N0yTUi+Y6Rw491qy7PMsw8Nzn
 bid06kJT+ABlT3vS/jNK5dsM5usj1Rv4+3PaCjizpo1je8g4y+Q2jywyWqywpWGqr64rDktF3rG
 +QgS2XGpQ8F5jI70rnPQ4ZKyhG5+1+zfk6vO1LqOuKkPKXcUd4Q==
X-Received: by 2002:a17:906:478c:: with SMTP id
 cw12mr2681419ejc.214.1644309017203; 
 Tue, 08 Feb 2022 00:30:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwUDohxFhVaBh94RQ4K4ESzFEuTlNG2YYSP/08Vv6gwZxNPIx+4GpBi+yhKGjhJXmCFAQevxQ==
X-Received: by 2002:a17:906:478c:: with SMTP id
 cw12mr2681400ejc.214.1644309016929; 
 Tue, 08 Feb 2022 00:30:16 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch.
 [188.155.168.84])
 by smtp.gmail.com with ESMTPSA id rp17sm2790003ejb.187.2022.02.08.00.30.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 00:30:16 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: yong.wu@mediatek.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 matthias.bgg@gmail.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] memory: mtk-smi: Enable sleep ctrl safety function for
 MT8195
Date: Tue,  8 Feb 2022 09:30:15 +0100
Message-Id: <164430901207.10840.1312269540907358317.b4-ty@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220204125543.1189151-1-angelogioacchino.delregno@collabora.com>
References: <20220204125543.1189151-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220208_003020_920435_901D8C21 
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 4 Feb 2022 13:55:43 +0100, AngeloGioacchino Del Regno wrote:
> Enable the sleep ctrl function to wait until all the queued commands
> are executed before suspending the LARBs, like done for MT8186.
> 
> 

Applied, thanks!

[1/1] memory: mtk-smi: Enable sleep ctrl safety function for MT8195
      commit: 12fbfd665fc473800d25d0f3ca4617c82cff42dd

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
