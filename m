Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40FC2606A33D
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Nov 2026 18:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1cYmhRKo;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZzzyARYY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=lp2V1CD3UzTfS8SfEqnuM0AkFNXDFtv8aXVUJV8xgrM=; b=1cYmhRKo8LpQ1e8o+vRySSyCQr
	DClooAPM8K0BQ+4flKLwmiPUuj7xHA2qsoxjg34oFuTtnOHE96/J9NurptEfvTwcNlWUBtoYRQLHH
	4/GYq5v5NFM5541ax12Y8oLinqKVCJPTRB+z0nePpOsEJ+99IVmleg25lyPatgcsoNyGfWaGuvkUr
	UQOEkbvFusOOJg7OOrRoRAy0lYa+31UtwdSRijJ1ibvAox8eTH2b6uR1fK8nY/HnLxcfsbdcf+9Si
	NYDI3q6XUzbMdeet3XkeSeutbYsEIKMzpiRbd2tWVS6Q4Vp3bibQsb6iQajPseC7BdOejqBzaWh+0
	h9mS7i9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVvA4-00000007UHV-3hmG;
	Tue, 24 Nov 2026 18:22:36 +0000
Received: from mail-dl1-x122f.google.com ([2607:f8b0:4864:20::122f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVv9y-00000007UGW-4C4H
	for linux-mediatek@lists.infradead.org;
	Tue, 24 Nov 2026 18:22:35 +0000
Received: by mail-dl1-x122f.google.com with SMTP id a92af1059eb24-1b5786e099cso2825274c88.0
        for <linux-mediatek@lists.infradead.org>; Tue, 24 Nov 2026 10:22:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795544550; x=1796149350; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lp2V1CD3UzTfS8SfEqnuM0AkFNXDFtv8aXVUJV8xgrM=;
        b=ZzzyARYYl6ppFv2mSKgwhSxPvM/7Us20eqAW1Y5bfAgAGxlUZ5tSTs1INFCFg/7MiI
         aqOGU3l7ypHgZcGPwe0T88siE+H5KESxB4pgcxU2UXQbjiHrQLLBL5xz9bpfBpLZvWyT
         rFA+B/tgWYVf0L67j6gwFdHn14nXs3KfE0zwKei4CdbirZyN8UYJTp9DqzVUfZzlYucl
         VW1UwIZz3DSWbUF/OlaYufuhesGimJ3ewX2zB7Hsv+GWDq/SaTa10oX2dltys02AqoyI
         svHpwij45E5f+jwIE6Luwk+PkR6NGTR20cPFMBf5zDBffsW/Z1oDf2OL72BGqSM8X8f2
         zZ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795544550; x=1796149350;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lp2V1CD3UzTfS8SfEqnuM0AkFNXDFtv8aXVUJV8xgrM=;
        b=UqpB+5b4H0OrWZXl4ZhWKF9QXY13hhCkTNgvtqm4lWddanpOnX7iGEg4VRTZkP4WU0
         nBzZJeHjpCJWvJHVXFjkvAzftuJWOdaZbIeqYks1oaqznxB+4isZmbdDvfEafUU2s/YH
         VJONbe3xvxlyVc1bpuFVCYx9gltbOERhm3eTdjiT+orFoGWITQQAxFfOnnmGyyKnP+v3
         bRcLH0GNcgfkWWovKmoKQ0rwKJCpN+NXki3T0N82/75ds9g2cA+x/ihjNoHRkyuU+Tr7
         cNjFfWSrpmngxbccZrLzHFbAmDd9v2+dHd+n3LB1NnCgf1m1Yved4fz6NnqqkHfjL3Du
         vHnA==
X-Gm-Message-State: APuU4Z/hzGMKF0F+L40MJFbtFncxhcMr7JMMPhBY6Co6awohkI4WUfZb
	1ntjuMHFIJ8Em7CZi7IvyMHj/uX+RSWIZuICu9XxtkSQ7TPDGRI5emBL
X-Gm-Gg: AZFdTZdrgOoLYrWyAl7cJ3qkxHp+x7718nL5wm0dpUX1TLt3VPCfrfA4QHfwZs+j7VJ
	0CAFuAlTDAYybgGd7xZfaBjYVwvIgiq+gB6BtF68IOazNSe7DOV7KamXq+jstC+ApcaVd/KnbQr
	C4ntFZ09hi420nnC60wqYx3kJ1TtBRzGkpr0Qh8np9gIpxg1oPigmPvIBpAlHAkSEZIgjDmnWvc
	5p5JtjUrGY5wwRymzV8NB/PtQtxgj89Byz7+D5WvxVZE8MwFpCuDa67AFKTUomLJ+M1R8qwXZyx
	OGHfXnbLIC6i75G/10okYgiiiE3CMpusvMOXSRK4l2LFdCIla5jerX3eCjvR+GYBC5GF4/i2b4d
	hddJxjyPxcwYCpGtdZCj0TV/6tJp5OwR2UUbZ3YUUZJ+TtiG0hAWG8K5YTQ/KrsncRMAJPQ5Soy
	wFKDsqCNS7A+nbXArruJm4QIpZv26eeeBeDHSxou/eq/QC1yNJpqfeFzlwpIKYOzR7OBq3++Q59
	ipPpyNGSzrft+P6rho52licYuKyslVxXePDdiJ+uG2Gg9DRs6XOpOZUaVj+J52vj5dMgkxpFIZv
	WUKwfb6sFe1zsUmF0d4hlhXZivGdyFS3O9d23oLp4Pvd7KMlv7NAJIut85Qc6oEMw1hoZVxXyll
	MafJz/KYkw9UjGrE/UA==
X-Received: by 2002:a05:7022:3a83:b0:184:992:c9ec with SMTP id a92af1059eb24-1b55693aaabmr20326331c88.38.1795544549929;
        Tue, 24 Nov 2026 10:22:29 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:ee3b:b892:771b:3bc7])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ff27bsm40472836c88.6.2026.11.24.10.22.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 10:22:27 -0800 (PST)
Date: Tue, 24 Nov 2026 10:22:24 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, Hans de Goede <hansg@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] Input: goodix - sync the irq controller while
 starting firmware
Message-ID: <awXV3Y080rMLw_VO@google.com>
References: <20261124085058.128173-1-l.scorcia@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261124085058.128173-1-l.scorcia@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_102233_144364_B69FC4EE 
X-CRM114-Status: GOOD (  11.28  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 24, 2026 at 09:46:22AM +0100, Luca Leonardo Scorcia wrote:
> On the Lenovo Tab E7 (TB-7104F), which has a Goodix GT-912 touch screen,
> the touch screen fails to come online after loading firmware, printing
> the error "Error reading 1 bytes from 0x8041: -6".
> 
> Comparing the upstream code with the Android stock sources, the existing
> call to goodix_int_sync should be moved between the upload of the firmware
> and the watchdog restart. With this change the touchscreen is correctly
> detected and working.
> 
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>

Applied, thank you.

-- 
Dmitry

