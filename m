Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E791AC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Mar 2022 00:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ny0BFZ94zgCkQfujdoJ/OPD0V0FiIOyjeRUmkPS5mhg=; b=rMWfL0Q9fcFanK
	OP6tuaoxQKAPRiVX7/Db2jmrxSnlk7ZweBmPVUR7wPMwO9FpYkbR2OU1KRD6McatKwz37OY9+64nZ
	4KtVv5LlDSChoxXCUw+Muk3NtoVIP4WBunEQnAaleeEzU7O9EeHO/vK06m3qm77ZMWapz6RRvwpV5
	8AtYsvx8QE2eBe3sBBEOitblJ4szksb2Nn0fKvVmzBXaOgTQyb4U884ADZLQpVtwbrDNe/EdNIRdP
	+rA5X/ocrtFoGR3vEpF4zPVEb5IpOS9tKREmwr5DC4Q/TUNwBTs+9jld8Ac9h6ZbEuj4jx7VuYEuz
	eH7loUu0F1I/POMXm/8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXBk9-00FFKD-Ad; Thu, 24 Mar 2022 00:54:25 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXBjx-00FFHF-L6; Thu, 24 Mar 2022 00:54:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9C168B821DA;
 Thu, 24 Mar 2022 00:54:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4455C340E8;
 Thu, 24 Mar 2022 00:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648083250;
 bh=YY3u466kTq8l7wermBlxhgdP++tiwPwanwuGyPYg6s8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VxnCxduQPUEtFRtz4pfTOwPtQANiGZ65a2nzfWJGOR2BuGXbi4CH/nLRc4IVFyJdZ
 pHQtkvn9oUDLzSlxdwpOLzpmQRcX5E0GB9D7TgD3q5u4Gm7Ekv1pHgAMEdjNpI+Cob
 ybgoGdRXXL9xonOMGn9DdzGykpync49zxln9j1HN5A25pmep2rmcjPzShaJvYQxnMj
 YCJz+7HbpdtBNtiJRyK63VGSWbllaC7WFF0JeXudbdfzmuMyrSWTLoxMES3vCZw07b
 vfWIdHGuwxKEgGJBnuF/aQjS4QNloXm37m5cEdJLs40XnY3W99A9Gwjm4PlgSYrWi5
 8/KhjEKM0+N+Q==
Date: Thu, 24 Mar 2022 08:54:05 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Cc: broonie@kernel.org, robh+dt@kernel.org,
 angelogioacchino.delregno@collabora.com, aaronyu@google.com,
 matthias.bgg@gmail.com, trevor.wu@mediatek.com, linmq006@gmail.com,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [v6 1/4] ASoC: dt-bindings: mt8192-mt6359: add new compatible
 and new properties
Message-ID: <YjvBLf/8M1WUS/L+@google.com>
References: <20220323164442.921-1-jiaxin.yu@mediatek.com>
 <20220323164442.921-2-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220323164442.921-2-jiaxin.yu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220323_175413_878784_EDBEF6FA 
X-CRM114-Status: UNSURE (   9.22  )
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

On Thu, Mar 24, 2022 at 12:44:39AM +0800, Jiaxin Yu wrote:
> +  speaker-codec:

If it is possible to have 1 or more items, would "speaker-codecs" be a better
name?

> +    type: object
> +    properties:
> +      sound-dai:
> +        minItems: 2

It should be 1.  Consider of rt1015p case.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
