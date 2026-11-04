Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71F9B606A33A
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Nov 2026 22:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uZ1P7UeP;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=SyA6t0X5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=uPpZHIHN2f+krnoJTSXhizzaZXUBHGCxVWnErBLk0sw=; b=uZ1P7UePCeFiIy33iq5lWeSj98
	Nwc1YbzmAQhGCgdpB+7TN5OZNnxKsIL6iCUtQDdujGOiQ6HlVkDftOvykZU09uzjrvYP4eFaCk4G2
	D0oG1If2uOuPHzvKUQBt13l2EmfGaSpVQXjsy28tPFLNgMfd/bc8x6InO8YlMZDyHCLcIfCCurdS0
	zXpDlgBbpZ2IUpVoee86IBBukxHXGBjlUcVoHNQstbCFrD3CX/v/ilwFQ+nftnlzIKeg3g2NzLJsX
	MKhHHt7ssILYpHRCkrG969j6qW8rkf02bAabHp2m32HET3vMkEZGnbgyg/Yi7Ur3L1Fz68jqPeYmV
	PIMvXX5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOj9L-000000077um-0ZPY;
	Wed, 04 Nov 2026 22:08:07 +0000
Received: from omta36.uswest2.a.cloudfilter.net ([35.89.44.35])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOj9I-000000077sV-3Ssm
	for linux-mediatek@lists.infradead.org;
	Wed, 04 Nov 2026 22:08:06 +0000
Received: from eig-obgw-5003b.ext.cloudfilter.net ([10.0.29.155])
	by cmsmtp with ESMTPS
	id OZeuxThgdRiNxOj9HxlOre; Wed, 04 Nov 2026 22:08:03 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id Oj9GxFGzGbtpUOj9GxeOaO; Wed, 04 Nov 2026 22:08:02 +0000
X-Authority-Analysis: v=2.4 cv=dIqmmPZb c=1 sm=1 tr=0 ts=6aebacc3
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=mpaa-ttXAAAA:8
 a=AhJusznchYkEs9MMiQMA:9 a=CjuIK1q_8ugA:10 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=uPpZHIHN2f+krnoJTSXhizzaZXUBHGCxVWnErBLk0sw=; b=SyA6t0X5HCcBfATZNI8Kbb4ksm
	hTB7osa3MOtNNirjIdy8uJ8HAWGaphLEybiIZNPeTBj+JeVI80v8EElmkTd4hWBuPa/Z3+pl5092+
	g1k8ogbs00esl5aa6vfujqZm05BPnNOXAYmYbS6FjwVyliDV9z2cyOaHG4eoufGv3F7acBqjphECZ
	a83clvz33UqYtmcmVN1kGQ5M1xWyCr2hbVp50kXGgewihE3mWC+1JybQabLER4T44tNtuEGUblraT
	lHRp8qKk/AeTvLQK/pMznIjGWDG3GjfQaHKI0mbyQQ+eTJPQwxlS6gFmQctKCwhoIFmA/PrMwIFA4
	RISQ6J5g==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:36806 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xOj9E-00000000ul0-2R7W;
	Thu, 05 Nov 2026 03:38:00 +0530
Date: Wed, 4 Nov 2026 14:07:59 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Zexin Wang <ot_zexin.wang@mediatek.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	light.chen@mediatek.com, Fred-WY.Chen@mediatek.com,
	Yt.Hsieh@mediatek.com, linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] watchdog: sbsa_gwdt: Limit the MediaTek WS0 race
 workaround to revision 0
Message-ID: <055e6366-83db-435d-af3f-4168a822a870@roeck-us.net>
References: <20261104083714.3026535-1-ot_zexin.wang@mediatek.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261104083714.3026535-1-ot_zexin.wang@mediatek.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xOj9E-00000000ul0-2R7W
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:36806
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 1
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfGbr3DrFYjmR+JoRloT22ql0C3Q0C1iZxewMHlayqsGop6XUNZU1k8uPUC+VQQ6v00l82CR0ZvaQ5LAij94aDfhnJg5vHWHc0BezExwgX1IQ9NuUN9oo
 ukzJrsb9PxBcuGC6rY7C+igD5ulaLRFa29O+TeRsggyFhhIsduEMeMOfnElOab9ujnaF5SPqw50rAbMUVzkM12sMrxcActG3iXE3Eo92qpQkZDfJeROk81oH
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_140805_304285_0E00584D 
X-CRM114-Status: UNSURE (   5.65  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.4 (-)
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
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 04, 2026 at 04:37:02PM +0800, Zexin Wang wrote:
> The WS0 race workaround is currently enabled for all MediaTek SBSA
> Generic Watchdog revisions in single-stage mode. However, only
> revision 0 is affected by the race condition.
> 
> Read the revision field from W_IIDR and enable the workaround only for
> MediaTek watchdogs with revision 0 in single-stage mode. This avoids
> unnecessarily restricting the minimum timeout and adjusting the
> keepalive interval on unaffected revisions.
> 
> Signed-off-by: Zexin Wang <ot_zexin.wang@mediatek.com>

Applied.

Thanks,
Guenter

