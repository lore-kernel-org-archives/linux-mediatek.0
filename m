Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22D64C5B572
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Aug 2026 16:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rL+1cscBL7DruRZtVhJ1GMBcU3y4ACC4gyo40QpBBnY=; b=pnAF4ZNCEEsHrv+mwQJZk932sN
	TGJEwDd/r0inNwtsNzy4aS0UNGw6oiy6ENaaGSN8CTunsjZHSh9jCsm1xc/0flhEOFRPfHSwflut+
	XQ/BRvjrXUyMI4Hl/+xOxiMyBl+JosdzUNgEZlkJoudqpdOxpf3AQ7tj0W3QhYINj54NUpOgkxQJR
	89doCXAf0qTw4pd0xvBVWUdvuVjIkIAK8L0KkvwOj9Hp9+UcYHGe77Pg8VWdJ19e/pqG+Yykluku5
	2mfrJd9dd6TayWz2ix7T06Evd4cudQkQKGYikxBwkyYb/8DdIvjO+G750b3Bw2CDL4ZobpQGAPYOi
	LmZAlfsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtp9W-0000000ESuE-0d3w;
	Tue, 11 Aug 2026 16:16:34 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtp9T-0000000ESt3-0YAV
	for linux-mediatek@lists.infradead.org;
	Tue, 11 Aug 2026 16:16:32 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-5aebd52488cso2062e87.2
        for <linux-mediatek@lists.infradead.org>; Tue, 11 Aug 2026 09:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786464988; x=1787069788; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rL+1cscBL7DruRZtVhJ1GMBcU3y4ACC4gyo40QpBBnY=;
        b=elGZ7axkbTEizaM4xCJ/GTH0pUj9qge+lPUd6t4U3y0UsmiS4Wg5CrUangEoemM84k
         d2G4KYqVwYgQZL+kEr8UEN7A3fncAznIjyN31pEfdzPwCXo62YTW3uCr4j+CmmPzHmeq
         S24fC40KtqDcmdpQTuWQoC9lUiR+sQA1On2Po1Ux6gty0aaV3sHIUFmwTRZeugyyody2
         1N33nKqbYc7PmzpRxwrNHx6qYxhr6V+yRjD8TKFGK6NrmHnGO3YORCaASAV4ube2WvxH
         r/UAlgVoUWrKnytXy3yUS31MEj2oyOheql7esUFnsjRbUPTRxkBg3Y8Aeu+basL05s2W
         V0ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786464988; x=1787069788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rL+1cscBL7DruRZtVhJ1GMBcU3y4ACC4gyo40QpBBnY=;
        b=N6kZtG7AM0tvdlfsGq9VE2pRgfDUwhLsbUOpXJDXxDQmWewzh37vcZhZ67oR3Qt74O
         RDR0YVB3sl5UsH1S306pHaI4XCTYNIGnMS7a0vrEwdk0SY35g8wgpZbn+mU3N+lRyBbQ
         j3SJaujYQ/ZNrxmiCoIxtAPGa59SZFkfuvb2qT/rGZIbprvSYtr/3I1iyuUUtwqzgc+D
         luowL75YGXeKkFV7mJWUA7DouKyRZHUN0prgZfeMxWreLCWmb3kqcdPKLp1u3BSBnaHz
         7jAuP44XnHkkT0kXbHTfcCVinxe2kYj0mHc8HHPf1uqSIbtzOrPxmsPzADMBqDTOo4UT
         FTbw==
X-Forwarded-Encrypted: i=1; AHgh+Ro8d9NqPkr+IpsFx6KE1l8r9vv7s0R6BNPCtimT5tvhwXitslStqd0zpDV2FXZ87NsL+yjzgyvGvko8Gm4Jww==@lists.infradead.org
X-Gm-Message-State: AOJu0YyUxwFpQ76MVBiz7L8sV9b2lE8Cs5sgrY8w6lpRPCNRgwGnrDqx
	C0YQ8+eOnDZpMo412ixJS1hYxw99PRmu9wIvPDC+qnTa3jExWsawgMHCz4Y8lAQ=
X-Gm-Gg: AR+sD11RrOLkBtnfXmDyl1+OkAjS41HG16k45FD4hrSn6dt/A3bv9ghb9FEhnzZNp3H
	o2UJmLExbmaij6RKluwoo63aFxoCsuv6S1aTQt8SDxq4b6V9L19JukmnVvcvBjwr5zrk32+Ewp0
	AR/yjtMjNmDOYH4maLf+6HVN9sKKiW3A5XCR/7BCdmkqx2iEk2wfhGpH6mwztEWI8APAy6Ad4SV
	svE1S28XwvYDwSubmO1CeNM7UuR68JfSzlK8ySsVDQYIU5wwO7lujttX4s8vb2lsq4S0cwlXp1l
	EWXAOzk+taEfjAK05nwI35aoMWxG+V5r5sXBVGuqBoTaVSrWphdXsI1P7Bu6lhilIcXdAS2XAge
	FAQkToR3HM1XIiv7gZM9Gd6btffCA/2827qw2h0GQwx7weEOrAquvJlwRgoZPWBM+gbN6Dw5Tms
	IcYnc6STO+0J5SOgLH8UuFaPLgGT5egfkGPomPa+wp6Dc0DHZatUk=
X-Received: by 2002:a05:6512:3e28:b0:5b0:1f06:f204 with SMTP id 2adb3069b0e04-5b448649364mr752550e87.34.1786464987550;
        Tue, 11 Aug 2026 09:16:27 -0700 (PDT)
Received: from fedora ([46.8.219.5])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b4486cacbbsm377769e87.31.2026.08.11.09.16.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 09:16:27 -0700 (PDT)
From: Vitaliy Sochnev <sochnev.v.74@gmail.com>
To: pabeni@redhat.com,
	lorenzo@kernel.org
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net] net: airoha: npu: load the firmware without the sysfs fallback
Date: Tue, 11 Aug 2026 19:16:13 +0100
Message-ID: <20260811181613.19199-1-sochnev.v.74@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260811110253.181862-1-pabeni@redhat.com>
References: <20260811110253.181862-1-pabeni@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_091631_191936_CB3BF832 
X-CRM114-Status: GOOD (  12.59  )
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

Both findings look right, thanks - v2 addresses them in the code rather
than only in the changelog.

main-1-0, the lost warning: confirmed. request_firmware_direct() sets
FW_OPT_NO_WARN, and the driver did not compensate. airoha_npu_load_firmware()
returned the code silently and airoha_npu_probe() reported a generic
"failed to run npu firmware" through dev_err_probe(), which at
-EPROBE_DEFER only stores the string as the deferred-probe reason. So the
file name reached neither the log nor the "deferred probe pending" line.

This is not hypothetical: I hit it myself building an AN7583 image that
shipped the en7581 firmware set but not an7583_npu_rv32.bin. The pending
message named nothing, and it cost me a rebuild to work out what was
missing.

Since the regression would be introduced by this patch, and the patch
carries Cc: stable, I did not want to leave it to a follow-up that stable
might not pick up. v2 reports the failure from airoha_npu_load_firmware()
through dev_err_probe() with the file name, so it lands in the deferred
probe reason and the timeout line names it. The generic report in
airoha_npu_probe() goes, since it would overwrite that reason; of the
paths it covered, devm_ioremap_resource() reports itself and the
malformed firmware-name property now does too.

main-1-1, the usermode helper: also correct, and my wording was too
narrow. "the patch does not disable it, it only keeps the driver from
falling into it" holds for the mechanism in general but not for this
driver's requests, which lose the helper route entirely, including where
it is the only one. v2 states that as a deliberate trade-off: the -ENOENT
to -EPROBE_DEFER mapping was written to wait for a filesystem, and the
sysfs helper interface has had no in-tree consumer since udev dropped
firmware loading.

v2 shortly, as a separate thread.

Thanks,
Vitaliy

