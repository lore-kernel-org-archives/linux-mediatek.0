Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2474C54E58
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Mar 2024 11:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BfRFovgeSp/es14HbwlQOHme/o6hW7Spl0nvOq+F0N0=; b=aicn1o4UvHlUclbjVVlhZyUtqX
	p+HPMQbEht6M3m/PaG01M9PHB4sme2uTcuZAgUGWLMiGBHv16smZwsikdcXL9AgDJZHxLJkTVikli
	ubUarT5wg5Ym+CUPoJepRqCRQwBPzLxrq5kMEBKk0x/IquH8GSB+VGrNsL81+fBTnES0YnGo/R7pS
	Rtn802N5nocWuZQCrHSZsU7VmKRvoYPfvmJ4/RBWC9F2lGruz1/5vWj0lX/2s3iNv5cVGWsS1R6nj
	fx0bx1nare5ZuAnYyrcKTZdhIX5+PeciqNs9eUCP19HrZlnTP/b+kPsajN582OtUPIc4SOrwjGhuT
	Gg7/OdeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmBEa-00000008OHv-0ms3;
	Mon, 18 Mar 2024 11:32:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmA6Z-000000087Sn-0qni;
	Mon, 18 Mar 2024 10:20:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=BfRFovgeSp/es14HbwlQOHme/o6hW7Spl0nvOq+F0N0=; b=A+bFlzYp0L3s/l/cXo3jeqSnkY
	XNU11vjWwN4eohAv5tft0FeiGx2ttSEzu+QdAUQ6IefX9AXH5g0ZukiiOw+vn7NhQf8suC/SUNDtF
	YyrzgZ4LmsHd3xIyze1TshuqWw/En65A4BIT4hqT6eQihnDEq5DXdv7XxAKXZE8j5Hi99hgk6JDe1
	DWSRz0XRKDn+meThmXPHskF+Yj/n1sj6fOcWShh/xFjI6En7SMXEUAs5qN5qw6xQ0tInpJzDl6uJN
	yxA1rfGIeUX2qjo9fzY08vnjwqqnzSQs/wjGcKbTaWY1FqN40KznRQ/JBPPpLfZMU2cZnS2B20HNO
	jyq0fkmQ==;
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmA6W-0000000CZwi-00eO;
	Mon, 18 Mar 2024 10:20:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1710757226;
	bh=x//SFnXAA+iv08g59F+aAIxM0D0meKGYLNErlalqk2E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lMvnkFqSztXnsc1kXJpvrP4snV8yFbiQYtvV4TkRVND7yUYL2dudYjxWw9FjOH7An
	 NGRNWepI+GrrYn/nSbOEZWE4ncWsaWLc+Y4euK3nh7fM1UeptdK1zrfcW8w4NrbSQz
	 n+bPwE/lchiQsMPZsRDlpJluwSTligecMFC+n8bdKXcGThsEO3hCYIMQ3u0WfXNmyo
	 aY4LTYBs/8taExAHwdsXHVYS6gsM8lFiyH56C9bUt7beX3Qrtx1g4bK5KeJFUra7Dj
	 IE546Pd4nQHEoS4A3vfZPQO+qCIAQ5f9kb4Nr8DNFQdC/O3el5h1UcVi2L6bG6+epq
	 3LY6TOnZjTBuQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id BF43F378107C;
	Mon, 18 Mar 2024 10:20:25 +0000 (UTC)
Message-ID: <ee50ba70-8393-42be-a82d-f4f6094a43bf@collabora.com>
Date: Mon, 18 Mar 2024 11:20:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/14] mips: dts: ralink: mt7621: move pinctrl and sort
 its children
Content-Language: en-US
To: Justin Swartz <justin.swartz@risingedge.co.za>,
 =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240316045442.31469-1-justin.swartz@risingedge.co.za>
 <20240316045442.31469-9-justin.swartz@risingedge.co.za>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240316045442.31469-9-justin.swartz@risingedge.co.za>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240318_102028_447910_0B410BAD 
X-CRM114-Status: UNSURE (   5.88  )
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

Il 16/03/24 05:54, Justin Swartz ha scritto:
> Move the pinctrl node prior to the nodes that feature unit
> addresses.
> 
> Sort pinctrl's child nodes into alphabetical order.
> 
> Signed-off-by: Justin Swartz <justin.swartz@risingedge.co.za>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



