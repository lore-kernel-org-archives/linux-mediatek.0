Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C36960A2626
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Nov 2026 13:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=l7aCThaw;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Kwa3VSx1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=3Md2bnpbIvy2X912Bc1LhqLaDZUJHkR+XqT7pG6E7/w=; b=l7aCThawBmf6fG
	+IlOQLr6LfPG1F275kjngHQxhr2Ddqm0dMI7PD/oiFBzrb9Tvhy9HGKcjsw3HDU3slzl4Dyl6Yy4j
	56gLIzKHaPLprInQXqRJztbcG64C/EEey2odYud9D0oUERakflgOhL5DyH+CYzl5bOpcUkqFFNBBV
	XjvmR/WqT9MdcMjmEp/2YDkYaZssC5LJ3iSlAFdBAjI3k5M64FyH3lP9PVtki6kSeTSAXwuSzeuza
	ApZC9TPE523z4c/pbi9ORp2W3C46gsO6TOw9iMHmamoUvMny4OwSkOyzs8aNJuvz1c2oaPoWVE3pT
	+G8BLzvQqO9SV2JSajug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNsHA-0000000Ge5f-325B;
	Mon, 02 Nov 2026 13:40:40 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNsH7-0000000Ge46-2Sys
	for linux-mediatek@lists.infradead.org;
	Mon, 02 Nov 2026 13:40:38 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso21050345e9.2
        for <linux-mediatek@lists.infradead.org>; Mon, 02 Nov 2026 05:40:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793626835; x=1794231635; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3Md2bnpbIvy2X912Bc1LhqLaDZUJHkR+XqT7pG6E7/w=;
        b=Kwa3VSx11z2wWbYUGG8A74AmO9zjzsruEnyuji8s00pYFbhhlIWeK6a74X4djDkunZ
         a1us+XlGF+f+jupqdN0oM9Rzmne2Hr2+qcj8f/QQ3ZaGPDYNzrn+4N49j4DRoezidmi6
         t6c2sKWqYgpPLBdV4KxJn/fMRlGxJUk6fF6nYlGXEB3Otnr4y0i/kfEKKMLX4zkAL93+
         KLM2p/jtELfDdoCx0YhSMpURhTRexh4fhZejCsV9MhOeeWkoiK98nr35FvlzIBoPXVw1
         QZgLYog/zFmi3LHz+X3IX4Dh/udl2cxAs4VifcrthJfPQ1I7ZxM46ZIVD0AEc3Zy5pKg
         6trw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793626835; x=1794231635;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3Md2bnpbIvy2X912Bc1LhqLaDZUJHkR+XqT7pG6E7/w=;
        b=PUvkIzwSA3tadIsiNXebYqcaaH/uuhY1yBi85C1TZ5dFkc7cWRKmqYDg8gXcE0vc99
         2QD5EcE3ig+j/EJ/Gvo/5ScnYS8ZQHm/zH/+ZKzWbCubmvXau8LyMgxwnRO7U8vvyz+I
         tAm1z+lXYSQKHUILDxYFyR6jvunByhp5oqQOK+wA6QoiJc69w9SvxkJz5IFF6PNHbeR7
         LJtV+Q3wqFu7wGriVXCZtixADEblCCetLHf/gQ5YNAQt/yOJdgRX2NTCjKVmcW0Ib8Zi
         1zCpVjq7d+Hjts2ihlSdGXxJ53NrtjCIXydSaj5GmB0B3v/9Xx2xXW0r38pSYtsJVcQL
         pUEA==
X-Forwarded-Encrypted: i=1; AKwUvBxDjR7pP6l00aqywozoEsi4o8H91cNWQT004MThHaepHwdudfYjfqyEzsD2eZL14MdLbLxFLsVPXXxf/JXgLA==@lists.infradead.org
X-Gm-Message-State: AFq9FYKR1jaJORsr0AZJ5sDokFmahoMNzJQZsI6eD0jSct2heGhHvEQg
	O2DI+FHjH3GsZQy3RZAC5a2Al9CcVRCi+3xqTKN8/EIBC9QoVFsURXISEal/EPNqFY8=
X-Gm-Gg: AYBFou0llMd6MXw/MMxGvjyysNjcZKVXJmlpT5F352oGKStW5RKJ4rbO3dBBCVjzszy
	jy0yeZfbsGPlZibijgGuQa4+hOJYJSVwhyAcThn/gEOB6yTE+fWOQpxu4+98o+cyiS0ljIdRzTv
	fPimE8kznI9zviQWYm9aefqxnvHzVkscsz8P372YCdD7Vsnat7rOJYxHXITOnORZIbLaujbrbdK
	uzMwhEs1nCtik0hCK7/2cv6x77R0nRnM695TEx+z5BXjDXYE68AzpKu3Nh/R1Jfnmv+lWJ5Bmng
	1ryM0I9aPB2RKdLvvwlC/32C5S/AwL6kofDyZkRlw9P2sb4v5xImdtJxGlZEGgqKzlIgBIzbWKI
	RqujJl1Hz4sBoowoeMl/uU2SzmLUPT8+rzGLbm65VWOoKgSTIdmIBTnRbzHUmkXL54xguC6iFQB
	Lmea+pyNDcxmI1BsHl9zPbSfXbOrbzPCVxk6RiBWZk44y3pzk3a+gQ57tjG54haIegH6tuQuXKa
	iOamg15s0SBY/CZVFQtqPN/YhlcPx8p8wx/izd+iElopcbEfzVbL9aWndE7hG1WtPnG+qccToz/
	9sNehSmCJsxjpPo0I72TyOj76YKGpkRmN6AiE+lcXEa64y0Kiw==
X-Received: by 2002:a05:600c:a4c:b0:4a2:967:dfb8 with SMTP id 5b1f17b1804b1-4ac1765d7d7mr233451845e9.20.1793626835401;
        Mon, 02 Nov 2026 05:40:35 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abea533a1esm189194605e9.1.2026.11.02.05.40.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:40:34 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 David Lechner <dlechner@baylibre.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20261006-panel-himax-hx8279-vddp-v1-0-50d884b42aae@baylibre.com>
References: <20261006-panel-himax-hx8279-vddp-v1-0-50d884b42aae@baylibre.com>
Subject: Re: (subset) [PATCH 0/4] drm/panel: himax-hx8279: add VDDP supply
 for Startek KD070FHFID078
Message-Id: <179362683429.3310106.6925209959908507351.b4-ty@b4>
Date: Mon, 02 Nov 2026 14:40:34 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_054037_656402_4AF8FB4C 
X-CRM114-Status: UNSURE (   8.82  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On Tue, 06 Oct 2026 15:25:00 -0500, David Lechner wrote:
> The Startek KD070FHFID078 panel has a VDDP power input, which feeds its
> DC-DC converter in addition to VDD and IOVCC. On the MediaTek Genio 520
> and 720 EVKs, VDDP is switched by its own regulator, and on the Genio
> 1200 EVK it comes from its own PMIC LDO, so it needs to be described and
> enabled. The existing Genio 1200 EVK device tree also turned out to
> describe the panel supplies incorrectly, so this series fixes that too.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/4] dt-bindings: display: panel: himax,hx8279: add vddp-supply
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/6ebc6210efd3502c8ce2b1b2740ad61f69188df7
[2/4] drm/panel: himax-hx8279: add the VDDP supply
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/dabbf2758be8f05c3757bb4727f2e48fba4ca66f

-- 
Neil


