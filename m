Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 385FFC77B61
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Apr 2023 12:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y93RjN7osl+y397UDjyIqrYTNL58RSMeMDAuuxAAix4=; b=ZjP5LE5CH1ifAaNuZ7tNhzGdBQ
	qFgMuWbKRDUUKy2MDW4YmnsEBJyBIz8ajEav3GCZXSjgOx/Dd2S2aJPCOjDBg8TZyzxNFCJj74LFh
	W2EsSxqj/Q8BxbLClfg9FamETV9xIPb7TtZ2gfY+eVSAbKxvgvmYeJJ8bfT+SKR5IuJ456nbd8dSI
	BEONqB8JgOi6tgrHN8BSefkZDmiEX1MgMeaoHUadmn1dqkAkJ5vXbxE6e+gUL6C4VQXfGXPd2gmVl
	/IqAWwLlTRo/00suAKcv8yvdIkEPJ3dyozPZxK4BtviV1+42ldi883Rog83PuosyM9CGRP0pZgFe2
	TqJc+WYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pqvhl-00GMPZ-2g;
	Mon, 24 Apr 2023 12:54:05 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pqvhh-00GMNj-2d
	for linux-mediatek@lists.infradead.org;
	Mon, 24 Apr 2023 12:54:03 +0000
Received: by mail-wr1-x443.google.com with SMTP id ffacd0b85a97d-2fa47de5b04so4250554f8f.1
        for <linux-mediatek@lists.infradead.org>; Mon, 24 Apr 2023 05:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682340837; x=1684932837;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=y93RjN7osl+y397UDjyIqrYTNL58RSMeMDAuuxAAix4=;
        b=fx/YbkRLMKg6m8Sa/za26aYtpnzU44YMASX9fjcUXDJGn8yR7Ruei6kmPPnj/ae8FY
         HTHCbo3Isb3+XAu5RDllgPIvu+vM5eBl5KwVAu/AaHbS6MhzPEDUJZbg57ayDeCKYuTC
         UHgqvXe9X8597K9pW5JsXW57AuSoxWHROFMGSRXoF4Oq0pTHOG+UAwWSJsY0kMPJPAhg
         1JiDorHB2655MBErHTYyR8twSll1r4wll3jKGWTnjqvio3OIamM/gzFSw6dhhPQZxSvA
         lrEQA0mdYBoRg/iDaPUg11FtaHkubjJsf9tnC1gsP+JyK/1IisATdHSc0f/PEvHsMoHO
         fy0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682340837; x=1684932837;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y93RjN7osl+y397UDjyIqrYTNL58RSMeMDAuuxAAix4=;
        b=gO1w+C4bkpCFA1k5s/2BqNQKman4qfy6wEG+0YKkIFR2NVElFNi24sE5vZJS7SNmeo
         knbKu0PxrIMXGSiyIt+KuPHxE+We/ODj5YF5GyRtHFqDuq+ueNd0pvhrwkmRSBSAeQPB
         58CPGQwMtLZ2Y+0whgJNVF+I8rwPR1dMRzeEEPBjKqlsnha4McI9ZHhAq7uu/BedFSVA
         7TzYw0NxzkLSJIcLDni5DaISC21Hj+z/Yyjk4Fuwrz0jWAx+MNfO6oVnRuBuj90Z5v8t
         Sr18EDjwJ6nWRKLwF94aaNLP18dt/eUo4W6JKd58lA6QTOe9sIS/hLnVPhR0iuO6Ttw9
         HoDA==
X-Gm-Message-State: AAQBX9fNlVavyhT6aZePPox/wgoL4811CiHtiyRNOS2mga7+xy2FkHxd
	UsX1iaT5616u58QoWx/030sUBA==
X-Google-Smtp-Source: AKy350ZskqXT7f/yELNEwYyk5svk4rLkjJJaBd/6wdB6QV5y6ygNp++IlFQN/sJSnWMbL/nLJZkT5Q==
X-Received: by 2002:adf:ec86:0:b0:2f6:fb98:fa62 with SMTP id z6-20020adfec86000000b002f6fb98fa62mr9644645wrn.40.1682340837364;
        Mon, 24 Apr 2023 05:53:57 -0700 (PDT)
Received: from aspen.lan ([31.221.30.162])
        by smtp.gmail.com with ESMTPSA id h3-20020a5d5043000000b002c70ce264bfsm10695285wrt.76.2023.04.24.05.53.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Apr 2023 05:53:56 -0700 (PDT)
Date: Mon, 24 Apr 2023 13:53:55 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Douglas Anderson <dianders@chromium.org>
Cc: Petr Mladek <pmladek@suse.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Lecopzer Chen <lecopzer.chen@mediatek.com>,
	Stephen Boyd <swboyd@chromium.org>, Chen-Yu Tsai <wens@csie.org>,
	linux-arm-kernel@lists.infradead.org,
	kgdb-bugreport@lists.sourceforge.net, Marc Zyngier <maz@kernel.org>,
	linux-perf-users@vger.kernel.org,
	Mark Rutland <mark.rutland@arm.com>,
	Masayoshi Mizuma <msys.mizuma@gmail.com>,
	Will Deacon <will@kernel.org>, ito-yuichi@fujitsu.com,
	Sumit Garg <sumit.garg@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Colin Cross <ccross@android.com>,
	Matthias Kaehlcke <mka@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Tzung-Bi Shih <tzungbi@chromium.org>,
	Alexander Potapenko <glider@google.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Ingo Molnar <mingo@kernel.org>,
	John Ogness <john.ogness@linutronix.de>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Juergen Gross <jgross@suse.com>, Kees Cook <keescook@chromium.org>,
	Laurent Dufour <ldufour@linux.ibm.com>,
	Liam Howlett <liam.howlett@oracle.com>,
	Marco Elver <elver@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sami Tolvanen <samitolvanen@google.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	Zhaoyang Huang <zhaoyang.huang@unisoc.com>,
	Zhen Lei <thunder.leizhen@huawei.com>, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] hardlockup: detect hard lockups using secondary (buddy)
 cpus
Message-ID: <20230424125355.GA4054@aspen.lan>
References: <20230421155255.1.I6bf789d21d0c3d75d382e7e51a804a7a51315f2c@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230421155255.1.I6bf789d21d0c3d75d382e7e51a804a7a51315f2c@changeid>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230424_055401_894115_DA2B3634 
X-CRM114-Status: GOOD (  20.13  )
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

On Fri, Apr 21, 2023 at 03:53:30PM -0700, Douglas Anderson wrote:
> From: Colin Cross <ccross@android.com>
>
> Implement a hardlockup detector that can be enabled on SMP systems
> that don't have an arch provided one or one implemented atop perf by
> using interrupts on other cpus. Each cpu will use its softlockup
> hrtimer to check that the next cpu is processing hrtimer interrupts by
> verifying that a counter is increasing.
>
> NOTE: unlike the other hard lockup detectors, the buddy one can't
> easily provide a backtrace on the CPU that locked up. It relies on
> some other mechanism in the system to get information about the locked
> up CPUs. This could be support for NMI backtraces like [1], it could
> be a mechanism for printing the PC of locked CPUs like [2], or it
> could be something else.
>
> This style of hardlockup detector originated in some downstream
> Android trees and has been rebased on / carried in ChromeOS trees for
> quite a long time for use on arm and arm64 boards. Historically on
> these boards we've leveraged mechanism [2] to get information about
> hung CPUs, but we could move to [1].

On the Arm platforms is this code able to leverage the existing
infrastructure to extract status from stuck CPUs:
https://docs.kernel.org/trace/coresight/coresight-cpu-debug.html


Daniel.

