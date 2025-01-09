Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CF83E7719A
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jan 2025 10:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zArLxslrcGh/OtDf8pnaxX4ZYz74YYcQRl2Asrd/XEs=; b=QeBNS6BzXNkuHV+sZUtB1n1bpq
	1S3XSSJ61oapN5LAYiqKU+tbYLl+4PqQ4bW60tZvfCOkedsWYpJRY2onN2hgnMSYgKTEdkkYu4DQd
	EELhCXoXxXswyQJ/WIWPgn0y0oU75ZOn08p78x16hb9pJ7GvL2oYq+popqiP5u6VM/yH/s4OOHp+V
	P6b4LpVJ3FCDxotpd+RME681k/UsVFGIA09lAN+afHYGybtHngReF54OtmbasWqSj29rGd2dDfy/G
	uw83vfEHaKfhQFDMzvIKuFnNaYNplP12kCuZ2dZj1Km5jVeJmWh7hDNR4f1lgQq/TLM2kEiBnJqJt
	ErnAfmjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVpax-0000000BU9C-1I09;
	Thu, 09 Jan 2025 10:16:55 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVpZW-0000000BThN-2dmq
	for linux-mediatek@lists.infradead.org;
	Thu, 09 Jan 2025 10:15:27 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4368a293339so9001665e9.3
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Jan 2025 02:15:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736417725; x=1737022525; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zArLxslrcGh/OtDf8pnaxX4ZYz74YYcQRl2Asrd/XEs=;
        b=wXLYdD87RWpdOSXplVeaswlzbYT/RnKsE8Vesk+XFwnUy440PEpF9cMnKlC6m7hfOv
         ABPUpyQDgrmG08s17YZGaNaHAmBtSUaeeFJHMsD3AJM3oIIbxMsZiK5j7g5BNIbyY8Vg
         2rS0Moq6672QJ4KWjP8bGv3TdbydzhMq3j6yj0XlgEpUpmoVD9Y6Rpy+6DjLEbKslmfw
         +DXvLbSzL2nF1wf8/TfK373d9qAAyePxYq+cAnBmsJrQNoV8pqOsiSg63BE9uv0c7ftU
         6m/B++gUQ3Y3DcCF5WLBWwvPAo28mKZZcBxav2vY7mcK4wQPhxK1QjkXLyoMfXmPY417
         CsAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736417725; x=1737022525;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zArLxslrcGh/OtDf8pnaxX4ZYz74YYcQRl2Asrd/XEs=;
        b=jkeRYN8bEphBNA+J/t6uqPiAnFkFfcrIuRDvp4MAMjaZFejXOGogzSjrmPCOpZ3Xmr
         iDFhX3swdrwlbNMi3cB/BfQPla1I4JyYI75mR//q3ydG06zYTOBM5wujU+L3h8cLWKul
         sd2KDSbGh/NMt7PZkKdKV+uZwKUnOqSswkDaYpJIJCksVK/oKjXMZH7gxXSy48NA5r3E
         3FJjbcAThcRTlt/8ckz0Z7108jwsRztbjUPVJfoFlskDmQdGjOxdzduB0cR8v7jy4Eki
         LEEKvgaJNRRjtTgdvlbeJyoH0pHD9/ZwSZAkledBjNLKs2w7KHp7uYmXBAEwkgFytmm/
         KCfQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/dsZ/o1WCiONn9EJDQZsWmHAWgzfV5YvVEuT7Uy62cE3U3x0t0kZHQO0petXvVnzhoL80M3te421M32K3mg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzqdlnGFjxXgfJQLS9CiDIVwzporJJfYLuMEdoNOJC+Rr+EqLJJ
	s0dQ9lNlh6qESGtPtHgj0lJKM/rQw6RHmPlRdZkkM6ykZ8fSnYsPUKFeUfb98Gw=
X-Gm-Gg: ASbGncv3iHlmzLUyaPckrR+IE8Xs6TXBb9EGZTY2vTe8V2C/11Z2NBYeDO6q1fo8sEG
	rBYMPQdR0OUOhJY6hGRKG15ptJ2WlYYJvwCwRB/qj7qiE9v20EHJT2ZU82r3vdy9QK1tdvovoen
	2tjKQZcIy8/ZhfBbRhbDCrcjeWtjHa0lxY6Me1/VA918+xYrwby7hXuPqH3V/SuMs4TMceujj5/
	m9WqcJcEtirLzPlOFPmNmfdIqDtO/aGAunBQxCNro7NRnm3R3hDBKg9Qp4bUZUd6IdAh8IJYRZN
	zmCFGlq8TuQWAY2htN+ck/HoKw==
X-Google-Smtp-Source: AGHT+IE5w//k14IKPlz1xAW4lBSZknnT4+N1Jzl2DExoz1dSucjgBd2oOBz/i2tz+E9s1wYVK89kVw==
X-Received: by 2002:a05:600c:354e:b0:434:f9c4:a850 with SMTP id 5b1f17b1804b1-436e269c42dmr62514755e9.10.1736417725129;
        Thu, 09 Jan 2025 02:15:25 -0800 (PST)
Received: from ?IPV6:2a01:e0a:5ee:79d0:125:358f:ea05:210e? ([2a01:e0a:5ee:79d0:125:358f:ea05:210e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2dc08bbsm49704145e9.12.2025.01.09.02.15.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jan 2025 02:15:24 -0800 (PST)
Message-ID: <9afabb6b-2e02-4b7c-8e51-9ca5b9a42aab@baylibre.com>
Date: Thu, 9 Jan 2025 11:15:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/7] dt-bindings: display: mediatek: dpi: add
 power-domains property
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>, Fabien Parent <fparent@baylibre.com>,
 Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Simona Vetter <simona.vetter@ffwll.ch>, CK Hu <ck.hu@mediatek.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org, Jitao Shi <jitao.shi@mediatek.com>,
 Conor Dooley <conor+dt@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20231023-display-support-v5-0-3905f1e4b835@baylibre.com>
 <20231023-display-support-v5-1-3905f1e4b835@baylibre.com>
 <173635697547.725897.5297567835361998238.robh@kernel.org>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <173635697547.725897.5297567835361998238.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_021526_670447_2BCA3856 
X-CRM114-Status: UNSURE (   4.97  )
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

Thanks, fixed for v6


On 08/01/2025 18:22, Rob Herring (Arm) wrote:
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> ./Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml:100:3:
>   [error] duplication of key "power-domains" in mapping (key-duplicates)

-- 
Regards,
Alexandre

