Return-Path: <SRS0=fNpG=PG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 197A3C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Oct 2021 10:45:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1E3661212
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Oct 2021 10:45:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D1E3661212
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Mime-Version:
	Message-Id:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=5JBtdR3dMYV8aZ273NwdcfG7U0kJc3l+sGvnOgAsRYE=; b=0cX
	t6mMuM75MtEWb2qxM/1NoSlT65lRpK9exnBWDcGtN7ansRbGDmkU0l3zV+6dAj5Y/IrbJ0Aw4BrNB
	+9zN5cw4A9A2p0sTKUeiZO5QtDG7GjH1xeJGzCHN/VmKXVdyNPsdONrwU3qoGwViVHq3XvHwKI/Gz
	HvSvmMaMZB4wkQgl635M6SYgDmBpBEiiV7JplgKpZuhZD6LOp2oF42U7Cs6/fUsF9YUa2LBNwxUUc
	4MhSzQGCponUSXWktEnsfZ6Q4trM7lTodmKlU5ULFxaRh8x/SbUnG/cyglLby3ONDr7PGb3a5sCky
	k89nGEsNSNFIE1Dw6Iw/XMRM50B47/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mcQ92-00F6Ay-TB; Mon, 18 Oct 2021 10:45:28 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mcPh1-00Ex6e-BS
 for linux-mediatek@lists.infradead.org; Mon, 18 Oct 2021 10:16:32 +0000
Received: by mail-pj1-x1049.google.com with SMTP id
 a6-20020a17090aa50600b001a0a81b8664so11644191pjq.6
 for <linux-mediatek@lists.infradead.org>; Mon, 18 Oct 2021 03:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=oY7miojajBsvdF3HUMaS1feE4pIqN0wiCXEms77CPnU=;
 b=gocHWodpj1y3RO74fcCC1l5rTkjYEX63jbzk4uPVGXLoZBssxTA641D0KRQ7Px6ol7
 Uy463QdXHg2f6fow9IKru0iQZrSPCHnLYpcd8hfQ2zKWIzPRdMEf97R3oOcvTNeApZGb
 ZzdhjXQPNBdXqnn7nrPFJUkaN2UFpowkQ/FACzdsdeYa0xS1QN7y7t5SQAu2MVk8QvUo
 YTiwGQud5dfd6G7YEOs7Hj162ebHr9v6GPL1J3ctY1m9Gx0I42JV7HOnIwYa06PYCmDp
 uW8N/ele3Gt1rYLG8Pye2O/ZARSZ0z2PBl7BSG1C4e0Ln1ISfiBeRg7oQSLo/DGfl/DC
 qw9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=oY7miojajBsvdF3HUMaS1feE4pIqN0wiCXEms77CPnU=;
 b=u28SeEDwoaAX5LzOKorAVyqb/R1yXOG1Q5uK7xb5FxXPd6klXEc16FY/6TjXp2vXIm
 5Xuv3MSl0lENUVjDmYoTaaguEIBX4Y60YIvLI0/NRFQyeaZvyLVvH+M4bgWRPvuReC8b
 1kB7b3LsWLJu6FIOcKUTZawFNmTx390jJ9SZWUD5eGKZHXvkzmRQSd5WMkjIIM/TKysC
 T//9mQJZDPmY1348Ks+BkTZxDWKlHjC8MeKJwh4FXGbSWSNOTk9upzU/1olJfj4+jevo
 gD8yA/I8l7s21CwrNcldttATUcZ9m9V6ZCVs5VdGKI53DdAN2KfeIddcwoAzAer7G+35
 DCgA==
X-Gm-Message-State: AOAM530NHEK8upRdnRw3ozGQbbaNx5ZtXs0eUy6zPAHEk0q8V9P4K7gA
 8slFpsMgoErhZtjNznDV91fjj2CXTTG+
X-Google-Smtp-Source: ABdhPJxVXkwD7Z4p19zoY0d6mrWKkV0hcUjQUx0QD9KXka6554CXjU42fH+hYE1xRvsAkQZcAaWr6WHqk0Ff
X-Received: from tzungbi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:e23e:fe98:6410:7fad])
 (user=tzungbi job=sendgmr) by 2002:a17:90b:1d85:: with SMTP id
 pf5mr31883714pjb.64.1634552189741; Mon, 18 Oct 2021 03:16:29 -0700 (PDT)
Date: Mon, 18 Oct 2021 18:16:08 +0800
Message-Id: <20211018101608.3818840-1-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.33.0.1079.g6e70778dc9-goog
Subject: [PATCH] ASoC: dt-bindings: mediatek: rename reset controller headers
 in DT example
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org, robh+dt@kernel.org, matthias.bgg@gmail.com
Cc: alsa-devel@alsa-project.org, tzungbi@google.com, 
 devicetree@vger.kernel.org, enric.balletbo@collabora.com, 
 linux-watchdog@vger.kernel.org, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211018_031631_456295_6AFDAADE 
X-CRM114-Status: GOOD (  10.79  )
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

Commit f07c776f6d7e ("arm64: dts: mediatek: Move reset controller
constants into common location") moves the reset controller headers.
However, it forgot to rename the DT example in mt8192-afe-pcm.yaml.

Renames the DT example to pass dt_binding_check.

Fixes: f07c776f6d7e ("arm64: dts: mediatek: Move reset controller constants into common location")
Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
The patch bases on next-20211018.

In Mark's tree[1], the commit f07c776f6d7e hasn't shown up.
In Matthias's tree[2], mt8192-afe-pcm.yaml hasn't applied.

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/
[2]: https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/

Also, I am not sure if the commit hash "f07c776f6d7e" would change
or not after it applies to mainline.

 Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml b/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml
index 5e9fe067f440..7a25bc9b8060 100644
--- a/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml
+++ b/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml
@@ -74,7 +74,7 @@ examples:
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     #include <dt-bindings/interrupt-controller/irq.h>
     #include <dt-bindings/power/mt8192-power.h>
-    #include <dt-bindings/reset-controller/mt8192-resets.h>
+    #include <dt-bindings/reset/mt8192-resets.h>
 
     afe: mt8192-afe-pcm {
         compatible = "mediatek,mt8192-audio";
-- 
2.33.0.1079.g6e70778dc9-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
