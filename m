Return-Path: <SRS0=9GQg=CD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D679C433DF
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Aug 2020 02:26:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A28820706
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Aug 2020 02:26:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Q5grjyYg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A28820706
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rO5a8K44gOgDVj+6hPbKodN1tEVEEYosiX//zvLw0lM=; b=Q5grjyYgMKSW+eRALssHOfUzA
	b4AyS3PS/8UTlVQ3H5BH92CGyd66V2unp6OPiSN2a2l5ozarqZXxuJJ2EJUsuMGi6ckOSTs+ck6Wi
	34Z0JLdoadlXAq5pKFvyHYIQxupSH+WSFbtVmXs9wjsLncgsvc2ML9Edaic7FrHeFJeYUPcecMOHE
	4lP8q1bUEZFlZ4RXu4bl2sOGa9s6CB7exAV1XBI4cSOZ3x9Eq+WhOchEWUwyK9Z4df+ddeJ3/AfZx
	9TtF58tgnUMzet7iA9ETdv5eQ6n/O5TSlxVrlnIaLpZL1fnD0ReP9EytfGXfCzCIHbiQg2ghMT0ZE
	g+eCf/oTg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAOf4-0001Rp-SE; Tue, 25 Aug 2020 02:26:10 +0000
Received: from mail-io1-f67.google.com ([209.85.166.67])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAOf2-0001RA-IM; Tue, 25 Aug 2020 02:26:09 +0000
Received: by mail-io1-f67.google.com with SMTP id z17so10925588ioi.6;
 Mon, 24 Aug 2020 19:26:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=MVs+XZqfKwaKJqJ+/fAMeb4kyiC4Q663ysaFu8EcOcQ=;
 b=bmfXjkODAfqnt256Qcr4Gy21k3cxdwrlXj2+4w5GDaP53Gt8wpp5c8lAFet6IlSh75
 3l1mwpQUj19YbuTJKhzPrjzo5tW6kZDFw5Pj++FICgMh0ZQI/yWub4ZHZ+T+NmAjlHfl
 h29eLYnZaxPxZneowMY2Zgoc/a9OXBXT+8fGdc9OAmtzNEzcdSmbP1u75v9BREmp03EA
 +LX62l3SmoHCzuolGr+tERwPfyi9QiB90RAPTP3yCWW3fMNyUwCAOOY61z2gejNqAdwj
 Kzw62pJ+15d/rkvD3elk9/hHbEGqEzDFXD7peVDHXtSsv3zzhpzFGTvnRlW2u6QKb4tl
 Ga2A==
X-Gm-Message-State: AOAM530YkR7LpHwH++7hgGpgeB+8gN0pUpsWY38EHBwsq8dExXz0UkOu
 VThYFkybOKTEU48LnSFpwBC22+cA7QXG
X-Google-Smtp-Source: ABdhPJwVLmUWRG3eEJmfYl9RyJ1uZxvCuvTxZNwyP1GM7YPLTJQdPSI/9oTn59Tl7UOcBEJlJ58bYw==
X-Received: by 2002:a02:9307:: with SMTP id d7mr8374323jah.71.1598322367810;
 Mon, 24 Aug 2020 19:26:07 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
 by smtp.gmail.com with ESMTPSA id d1sm8144326ila.67.2020.08.24.19.26.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2020 19:26:07 -0700 (PDT)
Received: (nullmailer pid 3816273 invoked by uid 1000);
 Tue, 25 Aug 2020 02:26:02 -0000
Date: Mon, 24 Aug 2020 20:26:02 -0600
From: Rob Herring <robh@kernel.org>
To: Zhiyong Tao <zhiyong.tao@mediatek.com>
Subject: Re: [PATCH v4 2/3] dt-bindings: pinctrl: mt8192: add binding document
Message-ID: <20200825022602.GA3816243@bogus>
References: <20200817001702.1646-1-zhiyong.tao@mediatek.com>
 <20200817001702.1646-3-zhiyong.tao@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200817001702.1646-3-zhiyong.tao@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200824_222608_682573_60F41B55 
X-CRM114-Status: GOOD (  10.23  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, linus.walleij@linaro.org, hongzhou.yang@mediatek.com,
 biao.huang@mediatek.com, devicetree@vger.kernel.org, sean.wang@mediatek.com,
 seiya.wang@mediatek.com, hui.liu@mediatek.com, linux-gpio@vger.kernel.org,
 sj.huang@mediatek.com, robh+dt@kernel.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, eddie.huang@mediatek.com,
 linux-arm-kernel@lists.infradead.org, srv_heupstream@mediatek.com,
 chuanjia.liu@mediatek.com, erin.lo@mediatek.com, sean.wang@kernel.org,
 linux-kernel@vger.kernel.org, sin_jieyang@mediatek.com, jg_poxu@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 17 Aug 2020 08:17:01 +0800, Zhiyong Tao wrote:
> The commit adds mt8192 compatible node in binding document.
> 
> Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
> ---
>  .../bindings/pinctrl/pinctrl-mt8192.yaml      | 155 ++++++++++++++++++
>  1 file changed, 155 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
