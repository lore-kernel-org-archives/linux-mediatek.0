Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FCACC79FB7
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Sep 2026 20:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WShcmBXFwgNzgoPR80LHtqAmSPW10etwWYZcOuhMszU=; b=2/cXdXvzBELLzcmvUHuLpdeYov
	swgSV7tvjL+XuloJ4Dp1WJQFeVa/GdKznQInZ+ON1Zeno1BboAFcoobyVOJAyNeDCQf7eeOaE7XRp
	t+9wSw0JO/CsFq6IguPVqItyk8OLloonv/VdBY9Q53kTFGt5XMNyVEFSBnlGmPU8Wocf0mAU0aUuP
	mUR+bRxyAI32h64JhB4Zx8SUOkRK11HyDuHVrcVvU2zm6lJ3Zithf8GtEAWGt1xZKmiYkaLdUMkXL
	Hnj3hKgofc7zob6RrGo/awuuwyMBCw9wGL+cI5rDa97UG/L91XvzmBeK0x6ngmCBLvlWQbeafkMKA
	9/zSebiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4P8F-0000000CpPY-49IS;
	Wed, 09 Sep 2026 20:43:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4P8E-0000000CpOy-1lFG
	for linux-mediatek@bombadil.infradead.org;
	Wed, 09 Sep 2026 20:42:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=WShcmBXFwgNzgoPR80LHtqAmSPW10etwWYZcOuhMszU=; b=NQrs5PNu08DEsvqA8QAeMljemv
	d2upHmfFxfIyVBGgRtcNjG0ilCfG9Ul4mZUlztoQ9tD2JScbXRN5JpIDbNXOflrsfh4UPZlAqxrdv
	S/R1pGWXXePOfcBEXzU44NgNdnuJqRkmmQMr0u+tv9qFoyEe1JvuWxs3CaMDiljw+PG1dhlQRrNgd
	Sl4xvvWCE5Gt9t74OwJQM/M3/oqOYWDZsOsMetXgiAIXsd7k16ufn8mLzuLl7qHQ8cauwHpsqIoxM
	yR/53+LhBZ+lAqXP3j0vsP78T6gCQuFF7ZHSvzLj+e3hKGJ2Ow9//xa/2n8ejyCvCyVV7Mt1zzRX7
	GhkzX7HQ==;
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4P87-00000001ep4-1M9H
	for linux-mediatek@lists.infradead.org;
	Wed, 09 Sep 2026 20:42:55 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-383b4a3755fso5930954a91.3
        for <linux-mediatek@lists.infradead.org>; Wed, 09 Sep 2026 13:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788986569; x=1789591369; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WShcmBXFwgNzgoPR80LHtqAmSPW10etwWYZcOuhMszU=;
        b=G/IxzWEYE27ZGM4GLQX+JaZ9y6v6wRtw9stSOOG6i321uK2ddZkSBzySf6Y/U/CNMW
         Ou0jL9legyL922GenJ9A6/LziJQ3zQIA2sFsSE5e7WdtIncDzGxZ0/xpP0aEStVnt8MR
         n9vyYeToZ3gVjn3m0o/AUkQ6HGf2iXjQ8UixNV5RhJgfZ88rgf46cPIuSJy3WVtQo8rQ
         E+akID7QrtwUta8yVQRggpKu6Qam5vZTzFF9w4FhBIPYRVsyhBv7TKWfVxhLqyNGr21C
         9DjEIe5rvMV/oHmzu4EEL6+/OBv46oRH9AdYA6nBVqbtG8FTxIeeIhIx6wOVVi7PHY/a
         W2kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788986569; x=1789591369;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WShcmBXFwgNzgoPR80LHtqAmSPW10etwWYZcOuhMszU=;
        b=c/zVf0gblVe1n9YtiCqAfINkXLaznmxaN5N0IVnIq1juD5BsE3fNYMMkht3sDIPa3m
         9vDAF22LBcL7oLAl94oPwDNMX6BSQuNxSieAyJVnNiIQmpEWl9tlH7QMpDbpUUtMehLv
         jkCrlvAHqc0v0R0Php/EvzwUZXnEp7I46znZ2+swZw51sK5u00KgAKwkJBULDzTSRJiF
         b0AZg6lJJSEsHmgf5tQeHcVHG828ZcrADrtTmMHrm4t6ttUNBTYeeJkhTtTkImhbZKRW
         AHeFqanKQ/l7nNtr44fmwYSYIDwnNq49AxS9z8Nhu4k5xLmyNxF+SjtGVZUhJYXDsMlj
         shAQ==
X-Forwarded-Encrypted: i=1; AKwUvBxcd3mEmWA32KanpgyszH6eYM9VQz37AHlpSoiovhfjU5t2jaReePycCYPdJLq8B+rtfZoh4+b0yjLpBnErng==@lists.infradead.org
X-Gm-Message-State: AFuF++kpGCRPDD2Rg84a8QW3Be8p9CTlBgoMljukwe1GZUCLdfJRiJRH
	TB805WgR8gyUNaZYRLI7Av2VFSNoJmSGOQMAhrEPE9h0zqF4dfEa/WJKlaotHQ==
X-Gm-Gg: AYBFou0b0cbhRPdJOuOGGdODo00xpn7bDdNegNiNy/n8AG/WyOKimIwB7wOOvDajlEx
	QwYH65d+cWhK8dMqQyL+eL6+5nvCnvBRtw9eN469YSc/yPW/DwbDZcG5WnMk34/K463kl094tpx
	AeLQjtDk5TIj8EViorhIzLw5XOeQHZSvxtFExUuWd3X+7vtWOS8KF+1TIvQmgmpJHG3TbjJl8LV
	cGW2U7Rl+gMFqAHJJ0AySTaEwri6uACo8IL+1PStfRj4l3rnXbC2h+c4WdrTu20Nj5+9doHiH6s
	uzwtmFguKT6IA+Pr6K3wR3tPNju1Q4apd1l0aVqbIGfJd3KdRYxBj3p7TLkzWRi14Dbxev4aGVp
	KPP/sdqKCViTq2OeWRDag7mfvV49KD/r59Pr2OmgamPFYc1U4RtPQQlhEayhwmyY7ZFzHuqAvQR
	amqmeRoMgI7PsGNHRL/OP1EjNx5SZdIfeudf+UOQz5xi389/In4PSTMJVP+AhCmRNQyKfYHwfX6
	nXpG+cpO6i2
X-Received: by 2002:a17:90b:2f46:b0:396:6344:3b63 with SMTP id 98e67ed59e1d1-39b260de5c6mr59642710a91.2.1788986569020;
        Wed, 09 Sep 2026 13:42:49 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d774197c4sm1220340a91.8.2026.09.09.13.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 13:42:48 -0700 (PDT)
Date: Wed, 9 Sep 2026 13:42:47 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Zakariya Hadrami <zkh@mailbox.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	linux-watchdog@vger.kernel.org, zkh1@proton.me,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v4 1/4] dt-bindings: watchdog: mediatek: Add MT8127
Message-ID: <6a212071-3b1a-4dcd-8d9c-8df6352813b9@roeck-us.net>
References: <20260909-mt8127-amazon-ford-basic-v4-0-e9af5c420ab1@mailbox.org>
 <20260909-mt8127-amazon-ford-basic-v4-1-e9af5c420ab1@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909-mt8127-amazon-ford-basic-v4-1-e9af5c420ab1@mailbox.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_214253_735246_404B6E92 
X-CRM114-Status: UNSURE (   9.19  )
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

On Wed, Sep 09, 2026 at 09:38:00PM +0200, Zakariya Hadrami wrote:
> From: Zakariya Hadrami <zkh@mailbox.org>
> 
> Add entry for MT8127 SoC's watchdog which is compatible with MT6589's
> one.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Zakariya Hadrami <zkh@mailbox.org>

Applied.

Thanks,
Guenter

