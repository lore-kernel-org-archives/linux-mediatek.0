Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C3F1F513F4
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Mar 2026 04:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qRN4R8ydX4bHhNIuCgWlwTOtwizlKM6MCX8177HggnY=; b=kGyaw/0yF4lfiNINsyfWZGfcRa
	69QwCa39vcdNCxv+I+4SmE4kh2JKGsoxB/gFrkVBWB1DS9Hy0TJwU98HyW9ljrsLuX9tnLLk46F2S
	E91Lfn8NtuhU/u00npPTphnx1v+ZpUWQaVXb8/5h5vA08NVFqs+9Kik1uuHH6BN0kPTtKUGxpNH8+
	o8dUPlShc7sECGXPUw29z1264gIqOK4faGVMHPuakxccG2ZU2VvhmngVXMxbzcrruV3qG3MeAZrhw
	uNf1ZBuewLYS/BQUFKqKBcdbcEEARcD9zeZQVd6AAx4RddNo2DiQD7t5b1/LN3iJV+I7PmsUsQeVP
	ZFN1dkIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyMUZ-00000002zZ1-2XNB;
	Fri, 06 Mar 2026 04:08:47 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyMUX-00000002zYm-3sfw;
	Fri, 06 Mar 2026 04:08:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A01AE60018;
	Fri,  6 Mar 2026 04:08:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27164C4CEF7;
	Fri,  6 Mar 2026 04:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772770124;
	bh=2PV8N8MDNTOIV9r2E8N///4zaacKBlEGosc7fKjx3Ks=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tmxtOwOhkKzMEj+l4kjbSGSuOg7q9bHOnXBu+LsMBBRZo8TYzqttB3ZNEaxUX6m28
	 igTKTyxj3cQRvmuvLaRvYHJw+nt5jnTp7wXY0m0QnUm8yu091nD34pKpvnSAIgAccP
	 uGSdwoFTKF/uACYkjMzjVw6CB1kQiTp6zQpGjdX/pX/SAiO6clV+uztpVXo+ZntuvP
	 agHB0e4n7vRHhepIRQFJ6LpOgMB2Be8yKcppfPk6Jvp/CpYr9ZeC46kfu4CB73QFsA
	 XOow38xou8xbkFJRc/SM44AAtfsLR94yXX8ZlwSrgYBRZWXksYlLpcZSRrXYMwN8DN
	 J+X+j28Gsr7mQ==
Date: Thu, 5 Mar 2026 18:08:43 -1000
From: Tejun Heo <tj@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Tobias Schrammm <t.schramm@manjaro.org>,
	Sebastian Reichel <sre@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>,
	Dzmitry Sankouski <dsankouski@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	driver-core@lists.linux.dev, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, chrome-platform@lists.linux.dev
Subject: Re: [PATCH v2 01/10] workqueue: devres: Add device-managed allocate
 workqueue
Message-ID: <aapTSyrkqqZ8j_XL@slm.duckdns.org>
References: <20260305-workqueue-devm-v2-0-66a38741c652@oss.qualcomm.com>
 <20260305-workqueue-devm-v2-1-66a38741c652@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305-workqueue-devm-v2-1-66a38741c652@oss.qualcomm.com>
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

On Thu, Mar 05, 2026 at 10:45:40PM +0100, Krzysztof Kozlowski wrote:
> Add a Resource-managed version of alloc_workqueue() to fix common
> problem of drivers mixing devm() calls with destroy_workqueue.  Such
> naive and discouraged driver approach leads to difficult to debug bugs
> when the driver:
> 
> 1. Allocates workqueue in standard way and destroys it in driver
>    remove() callback,
> 2. Sets work struct with devm_work_autocancel(),
> 3. Registers interrupt handler with devm_request_threaded_irq().
> 
> Which leads to following unbind/removal path:
> 
> 1. destroy_workqueue() via driver remove(),
>    Any interrupt coming now would still execute the interrupt handler,
>    which queues work on destroyed workqueue.
> 2. devm_irq_release(),
> 3. devm_work_drop() -> cancel_work_sync() on destroyed workqueue.
> 
> devm_alloc_workqueue() has two benefits:
> 1. Solves above problem of mix-and-match devres and non-devres code in
>    driver,
> 2. Simplify any sane drivers which were correctly using
>    alloc_workqueue() + devm_add_action_or_reset().
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Acked-by: Tejun Heo <tj@kernel.org>

Please let me know how you wanna route the patch.

Thanks.

-- 
tejun

