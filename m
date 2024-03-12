Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4444C54E58
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Mar 2024 11:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mJWFs0LcioUzxOEgN52+N6FAbBdw8oB/d/EgTSue7VQ=; b=v10b/o7vV5dJg5o5QJbx95IEi7
	vUXwnauWZDtkiAKq1WruLtavXaqmsDcnuLy91Y1VGmYvndwSuXgWiCpdSSU6jgUFneOfZV9AFDX0m
	sT/RzEJsouQc2b34LTpfuIX4Wsnota9y7+tITL8FpS0Oz7CpAQnhvx/mnfcpmWN/13qK5BLoUClaa
	zeVkhOycpYFnmOwFlnFS8annMBTtnaQZb+j/Kxd7MqrVlUi/TzEjdfdU2cH8xiqkJPwYdej4Cevwn
	Mv4nOs+ukeSa8VUL/tjh0ymgWFNPqQSpBCRC7N1unxqMFaqw6oGmD5L6xCQazERpXHWSx7vJuNMTH
	rAJfv2sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjzuZ-00000005SHK-161p;
	Tue, 12 Mar 2024 11:03:11 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjzuU-00000005SDu-3o4v;
	Tue, 12 Mar 2024 11:03:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1710241383;
	bh=tKgN9hgrVzLmXZs9MvkMyfYpZj3rKSCbDft77fPTWUA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nAHf3C2EXHOW3PUr+3y37Sb2TtXiad3myVRg5zHecSLWSDlB4+F8H8Mb2PubCvFAt
	 WnXxP+L2YV8LW3Rq+3kqqestqW7Bp+P3fBp5rl4xNCbSWyPHPGCkhxKLUxVadkDpyM
	 FoMKYbDIUWRoXrPQ0dhwxeLc4l4RvLDdnwn7AnkPfOFQvWctiU+jb6NJgXxW1MWbZJ
	 jXwtguWi0EaF47XAzFMSjurh2yl9jf+SwGVNgEQGenhUEmFRJixfphAiaaUqNfAQC3
	 tCZJui8qHW8VNqG9aXw0mhrN5Rbdwyh8bWEcJwIinbctAX1Fg8oiAyH6F08OYCiQJv
	 sfioVRYrNRXuQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id DD97A3782082;
	Tue, 12 Mar 2024 11:03:02 +0000 (UTC)
Message-ID: <11f2081f-eb06-4504-b713-b7013af04671@collabora.com>
Date: Tue, 12 Mar 2024 12:03:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] media: mediatek: vcodec: Improve wording & fix
 grammatic issues
Content-Language: en-US
To: Sebastian Fricke <sebastian.fricke@collabora.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com
References: <20240309-mediatek-typos-v2-0-7eaacd8e5401@collabora.com>
 <20240309-mediatek-typos-v2-2-7eaacd8e5401@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240309-mediatek-typos-v2-2-7eaacd8e5401@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240312_040307_172038_E247B30F 
X-CRM114-Status: UNSURE (   6.31  )
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

Il 12/03/24 10:50, Sebastian Fricke ha scritto:
> Multiple issues detected while scanning the code by far not a complete
> list of required changes but some small improvements.
> 
> Signed-off-by: Sebastian Fricke <sebastian.fricke@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



