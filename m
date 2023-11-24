Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95A02C636BD
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Nov 2023 07:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BiNjQ0m7825XeNPkOmddaxodtKmn5DLhLlrxzBZ4rzk=; b=aGVjNOYa94qX7TzP4bl/rupb8r
	FrmUClvC1+6NJkBfKC+H5Qry7VmBMNVzZPXXlK0kSvWiTTPwnP6FZzacNCCTJ0gJ2yZaZzNQwGleq
	PyhU3BziVuH9xJelBYivRdyEH6JlBTZT9Ko3ok0U0UrKwzGMFYEmNDVbEKYtMsZ1DD+OKoMdB0B5E
	rC5W7U+3LZHuVa8tsDGs3FBM0e+ktoXCeBR2bydXHjR1/AWKZmWKludPtnfxfGQrvo4uGnZpiZR+1
	CRi6R6NxETAvWV6lJRUH470C9A4At/nfYg5dMPTWvOhoJ9jkigdiLXqE4OEhFD2S7r3GhmiPiGSa3
	Df1Ud1NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6Qte-006Ptg-18;
	Fri, 24 Nov 2023 07:46:42 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6Qtc-006Psl-0g
	for linux-mediatek@lists.infradead.org;
	Fri, 24 Nov 2023 07:46:41 +0000
Received: from [100.124.219.30] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id CE18466022D8;
	Fri, 24 Nov 2023 07:46:30 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1700811993;
	bh=8LvJc8DaAgHeIHvOQk6AYJxeRlrV3q4wIVakxhIdGb8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Z9ihSIAdqUhMuQz9cCS/bwAmg2YL6c12FYaZKZOE5E7g8/LQH3vK7Z5qQiqUpBp7C
	 H/E0LW/5bWnBo0sXZAYEL6+5JpXKxm0emC+OR/R2hQTJBn/6lU7fl4ile4YO3aSwT2
	 BuR3+9KMeMjwQL09nvKxfl/kjb1Kc9He7tUmzKnVqZxBWehMdO1nmbNcTBxWAMkU+D
	 /5UN0N8+uUwJf1DC8gzc/BSCwMTmK01P379ZRX77WH8aFX3f4Qt4NQm9DFRPAIVrFg
	 yF0tNZWvbSZ0b+JbadNjsRbBorMOmlwMqYiO7pqx99IHuoyyl7xhdPkJkUO0GOw4e1
	 vVXd1rSFeLQxw==
Message-ID: <92467afc-cd50-41aa-a3a5-481c9da30a4c@collabora.com>
Date: Fri, 24 Nov 2023 13:16:26 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v5 9/9] drm: ci: Update xfails
Content-Language: en-US
To: Daniel Stone <daniel@fooishbar.org>
Cc: helen.koike@collabora.com, airlied@gmail.com, daniel@ffwll.ch,
 daniels@collabora.com, emma@anholt.net, gustavo.padovan@collabora.com,
 linux-arm-msm@vger.kernel.org, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 david.heidelberg@collabora.com, linux-mediatek@lists.infradead.org
References: <20231019070650.61159-1-vignesh.raman@collabora.com>
 <20231019070650.61159-10-vignesh.raman@collabora.com>
 <CAPj87rP=22Fw0h42U-p9fHd=6OHOu9Lj9kbpVMQVqL9U6BRE1A@mail.gmail.com>
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <CAPj87rP=22Fw0h42U-p9fHd=6OHOu9Lj9kbpVMQVqL9U6BRE1A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231123_234640_432427_4D7305CC 
X-CRM114-Status: GOOD (  14.05  )
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

Hi Daniel,

On 19/10/23 13:55, Daniel Stone wrote:
> 
> By the time we get this error, it indicates that there was previously
> memory corruption, but it is only being noticed at a later point. The
> skip lists here are way too big - stuff like drm_read is common
> testing not affected by virtio at all - so we really need to isolate
> the test which is actually breaking things.
> 
> The way to do this would be to use valgrind to detect where the memory
> corruption is. VirtIO can be run locally so this is something you can
> do on your machine.

Thank you for the hints and suggestions. This is now fixed in 
igt-gpu-tools, and the patches are merged. I will uprev igt in drm-ci 
and rerun the tests.

Also will drop the tests from virtio_gpu-none-skips.txt and send an 
updated version.

Regards,
Vignesh


