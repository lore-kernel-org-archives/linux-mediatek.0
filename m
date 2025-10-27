Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F9A5CCF9EB
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Oct 2025 07:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2VCn7I67W0lot093gUV4e8FUZ2HcsegXwgZoOoSOv7c=; b=PfWvZAQgMFnF4xfDXij5Pw3+U2
	Nvp11ZXPQ7C/ZmxtoEZWAFWuqj7q+eoZUfrR3OJOFjQ8g5AoRPTU3Qb3EkB51UxJG6i4b5ZjeTMqw
	eGxtpGccj8TBemtf75XGrZbhRV7nBC7SwqsA42ZRBeHH4SDQNoRugphziWQXefF+e07ku5AcPvYWd
	/dQ/3e2zMMb5XPjCtIcJWw40f/wxklAv8bXeaBU96TIRPfrdzr/IfBmpBBmc+3Peplv8YS5/cDhxp
	C+YLY28CKkaVfQTAYBB0OuE2rfS5S3nNGT8rYbZWQ3JyimaMqXC01I/Dq0N7GhXmSJAoHR2fHUWEj
	L/l62O0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDHLg-0000000DFpR-1xKr;
	Mon, 27 Oct 2025 07:09:00 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDHLd-0000000DFod-33Wo
	for linux-mediatek@lists.infradead.org;
	Mon, 27 Oct 2025 07:08:58 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-4298b865f84so2284780f8f.3
        for <linux-mediatek@lists.infradead.org>; Mon, 27 Oct 2025 00:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761548936; x=1762153736; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2VCn7I67W0lot093gUV4e8FUZ2HcsegXwgZoOoSOv7c=;
        b=XUmApBNmNg5rA8Ih7XshrXzIuN9HS05/LgYKdLE7iDtZSw58PEKiOkx82HL85i9uhL
         wGzWTKwIK04Q87e9i9kzYJ7vCAks5MEFYjdttboVzaiCGZdylPFokILL1iO9X3/8ezBB
         ZMb7H/VdxC9tOOKbCMUTXr5aI7jnizShNhH+5Yv9FzRIZ5KZH+m68BszHnVjmFANVNas
         gduJz+vm16K/zR9QYV4/FM2/DrtU7Y2dlz7dlNWKobPuRefe/O2eHVF89A4lNGfMY0M3
         p9iknlpvFPHVhWle2sw4jEpRCzLrL8s5t5PE8DuPLQFiod5ajlcGtiRR0hYppeyFYrwQ
         bv5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761548936; x=1762153736;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2VCn7I67W0lot093gUV4e8FUZ2HcsegXwgZoOoSOv7c=;
        b=slCAdEgnnSO30gt2uVJFjDmQyQeSpDxZfwwLRcHj2EUMVDOZffHKXO1tHfZq8yU/6B
         HEJranu/PbNXxofh9pCN4+0Vk2TrWAOpxfGHbYfI67OXHcQgaafHPE0FGTKwq2XyWrg2
         AeYyB9v6+/EiY5+rx0sK8pNSHOgtOJF3OFWI1HPijS26cKomI5N6eBFAoOUtdAoyiN9Z
         zvJrmD7urb3A/3j9pcG/6r6xf74Csbb4lyV6qeowCHr7wKPS7xYuAB7n+JRLaXXC7SIx
         V/xOHNwkgGWaDRhM1nIFfPY3QY+A+DSgKInXy4idVmWGvZTd0sm6n255Xu4j5atxxPib
         43Ag==
X-Forwarded-Encrypted: i=1; AJvYcCX1EDhhfq5t3PvJqShFmlD62OoT/jDSfC4Ml6FmXmF2fxvblEHuCsLDXnnaqqp964KJRizQq9HSbhulhw/acA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzJYeRGWHwKKUk8580FeeIZWXpkwcrhFJiAb28kW2TXTPpEwsJ3
	wfFjN9zIo7WaFKIlM/T7Os0mN9/Wz2u2VHC7g7jAKUjOrHi/jPCGWINOec2IjL0VDQ4=
X-Gm-Gg: ASbGncuO06y9twaJhau0rOqKiNnYOJXGDR3b6u6PvVHg8mcrcS5+ozUXsOOeQpavQCn
	Kzgy+D7OaS4MmB/Si5JumDdaFxIQGa5vJomEkuJt2snmhRfX8Tek0Prx6SF+Bc8zxXaZYQ9kOdj
	gJrjjwHJTDjkDcra9U7QEH8Ik7eL4IwnmxBYYNYJO+63Wjozq+HU+rV5w/kjH4k3Kz5L9JmiU/C
	aMDtQiUaNhw3gjwwanqJo+hb8rStumL+XeMXUQzqIo0CriQAMtSdwZTiyelyifGFAfhnbnh9qSI
	TFJX7uxwRu6t5SejR0FdAUwayR1TdKU4rm+OwJbwV2BKzQG48QMYdpqJ1ttsg5tV8c2Y+iNPD5Q
	PT7FI3V0UHA4mLTMU99C7bpOXzPNxWHRTf9at7cw87C7Qv2VSzWLqqi9rYyaquMhaUedQVPDN/J
	7AUREDp9PgXxTZm0Hz
X-Google-Smtp-Source: AGHT+IGoQx8B5H77NlYFS00H5yXNOz5JUZs/694lcXu0yPBw3rKGoC7GgPX+DZXHN83AY89E6HX4rA==
X-Received: by 2002:a5d:5f82:0:b0:3ec:db87:e8fa with SMTP id ffacd0b85a97d-42704d768b6mr25913703f8f.26.1761548935732;
        Mon, 27 Oct 2025 00:08:55 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-429952e3201sm12634747f8f.47.2025.10.27.00.08.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 00:08:55 -0700 (PDT)
Date: Mon, 27 Oct 2025 10:08:51 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: [PATCH v2] remoteproc: mtk_scp: change the snprintf() checking
Message-ID: <aP8agyKj73bLZrTQ@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_000857_814018_18D346E0 
X-CRM114-Status: GOOD (  14.93  )
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

The snprintf() calls here work but they have several minor style issues:

1) It uses ARRAY_SIZE() which is the number of elements in an array.
   Since were talking about char that works, but it's more common to
   use sizeof() which is the number of bytes.
2) The printf format is "%1d".  The "1" ensures we always print at
   least 1 character but since numbers all have at least 1 digit this
   can be removed.
3) The kernel implementation of snprintf() cannot return negative error
   codes.  Also these particular calls to snprintf() can't return zero
   and the code to handle that zero return is sort of questionable.
4) In the current kernel the only "core_id" we print is "0" but if it
   was more than 9 then the output would be truncated so GCC complains.
   Add an "a >= sizeof(scp_fw_file)" check for output which is too long.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v2: The v1 introduced a W=1 warning because of the truncation issue.
    It's a false positive because GCC assumes that "core_id" can be
    every possible value of int but actually it can only be zero.  And
    also generally, in the kernel, truncating is fine and it is fine
    here too.

    But let's use that as an opportunity to do more cleanups.

 drivers/remoteproc/mtk_scp.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index 10e3f9eb8cd2..db8fd045468d 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -1127,11 +1127,11 @@ static const char *scp_get_default_fw_path(struct device *dev, int core_id)
 		return ERR_PTR(-EINVAL);
 
 	if (core_id >= 0)
-		ret = snprintf(scp_fw_file, ARRAY_SIZE(scp_fw_file), "scp_c%1d", core_id);
+		ret = snprintf(scp_fw_file, sizeof(scp_fw_file), "scp_c%d", core_id);
 	else
-		ret = snprintf(scp_fw_file, ARRAY_SIZE(scp_fw_file), "scp");
-	if (ret <= 0)
-		return ERR_PTR(ret);
+		ret = snprintf(scp_fw_file, sizeof(scp_fw_file), "scp");
+	if (ret >= sizeof(scp_fw_file))
+		return ERR_PTR(-ENAMETOOLONG);
 
 	/* Not using strchr here, as strlen of a const gets optimized by compiler */
 	soc = &compatible[strlen("mediatek,")];
-- 
2.51.0


