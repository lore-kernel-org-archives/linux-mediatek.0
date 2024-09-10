Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACAB4EB64DE
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Sep 2024 10:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p4kJlZyJUknYz6/Q4Ukhy7C4W7XpxPaWCdiaCUDXZfQ=; b=aVQaYbHCHC81pHKsj0Y/skpGHQ
	2mYKzFGn4KaXXhGHbOV8tFq60BZs/VmjXHmkITx8c25SU5nq5c9cVYu/CrJAP+ND+k5hNLWNpnyW4
	/R4LzQYB1eQ1yZmzw9JfxFd3bNzgRoSCRWnV4ZVlxWPoC/ScObzIY6X0SJo1z0BrYwPnpaNIJSqkj
	7m0hM3KcKoxjJ1cIbzSRwVW2I5Zh8PXJFEQ3uEFZfQ3eHWaf6jIPqboRxEMFeK4OGryulNgCM6aic
	i5MnKeqsgPbIbPr40jRqba9X6FYSQrX2vgE17QzUQrYcVS9cH6pug59lcfYPUGqiiRIo6c0SDunuX
	FPG8rO0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snyXt-00000005Jdl-11Os;
	Tue, 10 Sep 2024 10:56:29 +0000
Received: from a7-41.smtp-out.eu-west-1.amazonses.com ([54.240.7.41])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snyTw-00000005Iy7-2sbL;
	Tue, 10 Sep 2024 10:52:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=4232tfv5ebdrjdwkr5zzm7kytdkokgug; d=collabora.com; t=1725965541;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=oHfNoX1WgFE0WfNPPoO6VH/fExk0MByWcc4Y41dOXFE=;
	b=Uw/UQxB7kRwtua6Visa5NFKMeD+6bCDjCwgfCNgLkWIkBtiV6gkQdOIG4GJfZMy5
	yDNoR3jK1A8lV+Dl+UdpwVN+8OXYMY8D8LeRb89Vz9wkKxMBNMU0EVCL/VKDNGw8AH7
	MXvHiQYhYg03UfUG4uAqp0s7aeMqhP56HZd/KJX6ivq4gp1URC8uuEnpU17TpUXj8SU
	+V5Z0oqHmFDiLKcSVc7FXAXCVvnznuA8HfT1WEAzKSyY0aLmig5M+q9KrVjYZVzsn4x
	8KJC1NgnF+uRu5MVVY7aSWN+cXrMrJsM7Iy5YbW+Hluk7P5GiF/lnXvjMzNzVfExvST
	RtTjpe8uGA==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=uku4taia5b5tsbglxyj6zym32efj7xqv; d=amazonses.com; t=1725965541;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID;
	bh=oHfNoX1WgFE0WfNPPoO6VH/fExk0MByWcc4Y41dOXFE=;
	b=UPYXPqCN4IynNJClUxeQu234nL9lBI2mlOwsU3Xrzflyncz9XUEJL1uHJsBvkHrB
	BkkThpsCUP1J4CyvCKAh8KIuwkUqcFZRDs1k3bagj5AoqMJGwtSG4A8VgvwJ+FE/2ax
	j4rscSNQnIs42MAhpnb2EErzqwUkNZn+ErZjRdVY=
Message-ID: <01020191db901d32-5c318445-b8f4-4f4d-86db-316dc0db04ec-000000@eu-west-1.amazonses.com>
Date: Tue, 10 Sep 2024 10:52:20 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: mt8183: set DMIC one-wire mode on Damu
To: Hsin-Te Yuan <yuanhsinte@chromium.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	Hsin-Yi Wang <hsinyi@chromium.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
References: <20240910-one-wire-v2-1-2bb40d5a3cf8@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240910-one-wire-v2-1-2bb40d5a3cf8@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Feedback-ID: ::1.eu-west-1.YpP9ZbxnARFfy3Cb5pfsLd/pdsXBCNK0KEM7HforL4k=:AmazonSES
X-SES-Outgoing: 2024.09.10-54.240.7.41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240910_035224_960971_24B20CFB 
X-CRM114-Status: UNSURE (   5.59  )
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

Il 10/09/24 10:47, Hsin-Te Yuan ha scritto:
> From: Hsin-Yi Wang <hsinyi@chromium.org>
> 
> Sets DMIC one-wire mode on Damu.
> 
> Fixes: cabc71b08eb5 ("arm64: dts: mt8183: Add kukui-jacuzzi-damu board")
> Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



