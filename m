Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5024CCCF9E3
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Nov 2025 11:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TZrYqw2/O2UZmuuLXYkU5bIjhuFDnuqQ3/E5dCC+u7U=; b=3+2G5hejjXMsSX0GciRCQC9TQA
	KrwxMvabI7UBrq0mSGa0TFAWoQ4SLuDW/nQQ/BChWgMZbifsqWlrVXgwHW5wqs7Th6+duw7Mn6WkG
	ISLASOtJw1jSg0gY9iIJlmjOYg82729I07wlqGkvpENkY4dqr632EKhA/5l55B6d3whWPZv6B7hHN
	K3IoF5B8Q5LQz+LdqNvLtJ7RsvA4MJVw85Xs+LVpfdY5l/TKifg2U0ookzsj59+L6qRiUjAbY1HDq
	UFCQZZkeecoXn79/IzrTUGJFX/45Ashxxq+olGy+Z0QpLNHJwaq3Surq77U4bktYViHflcR4BJBSt
	FDIF3pHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIPjx-00000005GLK-0HGg;
	Mon, 10 Nov 2025 11:07:17 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIPjv-00000005GKf-1jVH
	for linux-mediatek@lists.infradead.org;
	Mon, 10 Nov 2025 11:07:16 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-7aa2170adf9so2283042b3a.0
        for <linux-mediatek@lists.infradead.org>; Mon, 10 Nov 2025 03:07:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762772834; x=1763377634; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TZrYqw2/O2UZmuuLXYkU5bIjhuFDnuqQ3/E5dCC+u7U=;
        b=LuM/6Bhq3oXpzEHMsJIXBFfmvMrzFVt5IE5raNtXUwzT9FpT2gSOg2xhVPkPbNda/k
         goahtRBjKAUO+lqtHds2prf/OmWWuNjRMfu9VjVG06x4/X5suQj8+NfadBeDRwgbEHMO
         8a4zSd09c4gu6hu6f4Osi2arnNGFQ2vUveLosgw5ZghmCLE7yzXSIvt/LYO0OQUnaAa9
         sm6YaoNhl/nKeAgzgJl7o4CCtzg/0Bg4r17YtyFxhj8wBZ8tNfT6SvjoMBRqiWrvIrNY
         yTP/udV7K0DB39MlFBdmsfD6x3IwCFw3WJp28Gxy2hif8d065NVfuonrdwskUVxp9XqH
         Ir1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762772834; x=1763377634;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TZrYqw2/O2UZmuuLXYkU5bIjhuFDnuqQ3/E5dCC+u7U=;
        b=XRrkYYywUrBkO8k2T3AvtDW+jDXQx/anO+Ddqg7PUszydo07VQOedojf5dVdvRglm3
         ltJJTvt7AzOQ8uJWM5l3ejl80RyJHUZEK00CerUriZ0S8SNue2Kg4I9BC0E0l+lLbvoF
         Jo4S985g7uPEu0SF54wD7HqMBGjmPrbwJzx7c2Vr2EWc8gO4jB18hcCQyC8HulAv6AMW
         dpImyjB31TcpBqZ8n7iwArBxTgc6xaoSa0oFJCgeyJZEF3LIu1WzepRxKozlcgAfifmP
         56DxNQUgNh9N/Q3P2Q8QA+w26Dk0gMfpze4Np+ojbJtw0Q/IZYrP26XGNXZsn5zCzK5w
         pJ6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUH2WB7OP335tsrwpWVCwHzMSi02443yL4tVjIeqo0Ir8aDzxDcJV/h4swXrIuY0taWuSj/vwUiCF6MQ9V8hg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5rL3sCh/e1pfKbBq/MrDA37NkrjNrZ/F9YKPEixE1omrelZP7
	IIEoHSJCGOy9/m5nT+Tuva82VqbAayX1WWrhvZEz9Z7X0uvMH564HDsrmV2gaOaYTJg=
X-Gm-Gg: ASbGncsSsfT6/JmUu9bYWDZrgInQtzPVFMlwF8FOtn254UgUUH+bJh316mRN8eb+T+K
	oBnXz96Dy4tzq4mLGzj/lKmMHUg7gXwAB5BBmo+HJmC+ZskB7t05W79pfIg/mayngPqO9X0DEpo
	BrnCfDlbCX5g58wMsDBqYjbu4WL8hpPKCp0ISqxpXKZwqbqlVBwrtuVBA1LxRQaH+5JcL3/LteM
	DCs6xfDa9zhJf0ZerRi8MDRDiyRU7761JWIyUTQR/gigr4M49NuJ2/4vr4KnvHHqi0kRmC5tdUG
	ZqzPqDsZ9fEN8uevCDjZE3hwuxoAgXKIEfXd91C0uBrFVx8Q3XoiB5ulQyWuWDPfd34tKouVg6g
	GXYUHJZg4cpSSMlwtpHB4fJp87qS3mLpoXcsR7CPr2NndVKC8T4OFZsb8B+oAAzv74Pj5zc/xxe
	1x2TTs36TA5i8=
X-Google-Smtp-Source: AGHT+IEEBmMVZO0k0MIdHGG3oOt1wzE07GZr0Rosgte3T2/mK8NYjyyq/dXAAAQzolcEZu8MEC+rkQ==
X-Received: by 2002:a05:6a20:12c1:b0:350:d523:80a4 with SMTP id adf61e73a8af0-353a314ff11mr11044525637.28.1762772834004;
        Mon, 10 Nov 2025 03:07:14 -0800 (PST)
Received: from localhost ([122.172.86.94])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0c953cf79sm11625705b3a.3.2025.11.10.03.07.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 03:07:13 -0800 (PST)
Date: Mon, 10 Nov 2025 16:37:11 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Yangtao Li <tiny.windzz@gmail.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Maximilian Luz <luzmaximilian@gmail.com>, 
	Hans de Goede <hansg@kernel.org>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 02/13] cpufreq: dt-platdev: Simplify with
 of_machine_get_match_data()
Message-ID: <qg6xxh3vwbfnl3z6otlr2bue2paig7w3agbpbauuzmppiof3q5@e4xjlcfu43cw>
References: <20251106-b4-of-match-matchine-data-v1-0-d780ea1780c2@linaro.org>
 <20251106-b4-of-match-matchine-data-v1-2-d780ea1780c2@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251106-b4-of-match-matchine-data-v1-2-d780ea1780c2@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_030715_460364_2CA7AD64 
X-CRM114-Status: UNSURE (   8.96  )
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

On 06-11-25, 20:07, Krzysztof Kozlowski wrote:
> Replace open-coded getting root OF node, matching against it and getting
> the match data with two new helpers: of_machine_get_match_data() and
> of_machine_device_match().
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh

