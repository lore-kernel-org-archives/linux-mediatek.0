Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC86CE99071
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Apr 2026 10:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=D9vi1Qcy5IQgvj+vG0eFK20Y9MjA+J4iFlYIuZ+D4fU=; b=pURgXKIviIXGntCL0o5mteR5Iu
	XlY7XswaJD/OzwuUncaErt3WA0loc0k8/HeSPu7oM8i7e7C1FY6SCC76qDwAS4oEUMMsWx+fphICy
	5Ac0VEBU3Iqaec9bgfg2Fgm8OH7Qicjm+by5iRVXHWJqGA+iEuaYm0pA6N3X43w/GQkqWjNN/FjIS
	dDYgc+5WiZjRsMRsZ1PnjVyvYk5NCvmORQfimPgyLDPmTC+6qGWt5/9UQBM4Oz8qaksDAkybALCIR
	B40vWJiKMbpyfnh/Iln5PEd07GFKdlFpkhlY1KVgwdU0WXrYFOGfNGicO0EOQl6w8raIEkrQnnRG5
	/ZSXTotg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB8sK-0000000BzCk-3avF;
	Fri, 10 Apr 2026 10:14:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB8sJ-0000000BzCU-3dX8
	for linux-mediatek@bombadil.infradead.org;
	Fri, 10 Apr 2026 10:14:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=D9vi1Qcy5IQgvj+vG0eFK20Y9MjA+J4iFlYIuZ+D4fU=; b=fvZbcYzyS/aXF79XUYBP2SeMfQ
	ZmCJcCXNDdHSfkZdY/3yKpyL9qVlnE630OkEOCHkpR4P85RbfznbRsrBRFegdiIPkvgiY4iqIAZC7
	QfAeh0AMuy95oNU2j7ix6/x1CnigqQU6yKrNz4Z5V/zVbNDZAr74m2hV8i1GdCzlWvUjmSp4rWeT0
	D4ByaXX0oyg8wnQi0XsNy2X9vB1k9jqd7LI199VvMamhZQMvax2Vu1W1cOhzMlUqi81LadzhANgz8
	QXT1Py3oGCEKdUHePU34khVodtd7NIPJeT9l1UJX50Ibv7iWI6i0idHYmBfTyaJ+YGj6zkC6IaszA
	d61+/dfg==;
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB8sH-0000000DGoy-0rsy
	for linux-mediatek@lists.infradead.org;
	Fri, 10 Apr 2026 10:14:06 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4852b81c73aso17176895e9.3
        for <linux-mediatek@lists.infradead.org>; Fri, 10 Apr 2026 03:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775816044; x=1776420844; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D9vi1Qcy5IQgvj+vG0eFK20Y9MjA+J4iFlYIuZ+D4fU=;
        b=klLVXyhV3QwvHoIhrP11acHD7fSvMZgdTZ5sUznJgvEl4TPDzPNtZ5e9TaS++jTs2Z
         aicHQstflH4kCaSbhOKT126t052/Lmp1vzptCtU+vYvc8E1VoFbCC8jNnlLprPEETZH7
         qbjVW2Lqk2l6z2xnwZylfEETizBoaxIZPNrgUmlDflhLPIbaOEv/aW2WwPPKmllWCMYf
         R54m8ZMNJn8Vt29kUbqpTmGQYQcS8jqgraCxrb7fcFvGBJJ7XRhWNKIQWPfdAplRWVJ2
         u5xVvSXWvF+y+7z0HMDoTBFBpuoGWIYj51bzXrg6PVlDGI4rRIelSUQHBnPnqGSDRyqA
         dagQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775816044; x=1776420844;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D9vi1Qcy5IQgvj+vG0eFK20Y9MjA+J4iFlYIuZ+D4fU=;
        b=EzNAChMOOv9hzdO2WjeHmO7TuKKtmrV5jXyL5L7ST4wGRVCc7AFer2FykW9O3znsh+
         /hbufJ4SFmSWL8iVPaDKFG/IFxYbL1Qh8gw4Exsvh9TInHrvfIexKUeMIOY5jHi9Hq3y
         1VJaRwxiq1u0E0n7DYmAg7NcEKVucac5huNXF+EAk+UBriLB6RCZHeRitTiPlPoCES4l
         +40EhtGnX8Qh3Ew7qdBjljMQkLN6quiuhhcASrM7bHPnacI5ofYe0vsxB5HJokcmBs8l
         iFYKcppW7oE0vlONNJx8bTmJ+OyrRzQmQ7mde2Zg+JUcIebu8RKu7OLjve7kyE45s+Pm
         Nspw==
X-Forwarded-Encrypted: i=1; AJvYcCW3MionQe6VSBnsMakzIhH+S3jw8A+i6WZXygdGb7hpqiGentbOvfpRyeaNOsRKGTTC0w5xwA9yAjyxoUXk3Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YxqMUJxKhuLI1hG0wTJokbqlsMzgRYBx2V0qe9d3d81gUkv8BY9
	Ur18jabcdDr6jYUt5AuEbLpINRtT9Qh5zS+5ieMbyvmdBzd1u6k4IyHf
X-Gm-Gg: AeBDiesNShh3HOpykYN55K0P8X1LA0s/Kdplo45bJkdLIxrzY1ZKsIm3Qq1AUxHUHen
	n0vKMla6dg0sy7mKfQQtwPVc5B0EEuPN2jvbVigkwqLeHhPMocFRqZZ5TRljNIHtYZRpKkB4dr2
	pGXcnJaAJTBKXlT5EQOYcnygh4Hw5c0bYsWAI91ktoixPcT+Fe/tI6XvQswf+RNvHc7OlRaRCqd
	h+ipK+BzjJL024e8yIk92da+Pw7AKfQA6vMMaqYYdng+uhkG0i9hKCSClFIvrC/HNduJ4c5SQbh
	C0Apr6CQLGtuKwjpAZE8GnNpARnQ1bgS0zlkbMXnzEdb1RjONOUh8tkqjlqFviLxTojoc/oQ2eP
	5u8USmh7AUPtNa4BIl/lqL/DiYDThiyU4pr/Rf9ZBKYt8S/Me/EsyE3JeKtMW1EvWA+ySjl73X5
	2e9k/dUO1rEsBLZIBEgQQ=
X-Received: by 2002:a05:600c:a409:b0:485:9a50:338d with SMTP id 5b1f17b1804b1-488d67bbd10mr27672835e9.3.1775816043400;
        Fri, 10 Apr 2026 03:14:03 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d681ea59sm17034435e9.14.2026.04.10.03.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 03:14:02 -0700 (PDT)
Date: Fri, 10 Apr 2026 13:14:00 +0300
From: Dan Carpenter <error27@gmail.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: [bug report] PCI: mediatek-gen3: Integrate new pwrctrl API
Message-ID: <adjNaKB5KGpl6qIp@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_111405_318425_F7E60DBC 
X-CRM114-Status: UNSURE (   6.53  )
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

Hello Chen-Yu Tsai,

Commit 1a152e21940a ("PCI: mediatek-gen3: Integrate new pwrctrl API")
from Mar 24, 2026 (linux-next), leads to the following Smatch static
checker warning:

	drivers/pci/controller/pcie-mediatek-gen3.c:1226 mtk_pcie_probe()
	warn: ignoring unreachable code.

drivers/pci/controller/pcie-mediatek-gen3.c
    1202 static int mtk_pcie_probe(struct platform_device *pdev)
    1203 {
    1204         struct device *dev = &pdev->dev;
    1205         struct mtk_gen3_pcie *pcie;
    1206         struct pci_host_bridge *host;
    1207         int err;
    1208 
    1209         host = devm_pci_alloc_host_bridge(dev, sizeof(*pcie));
    1210         if (!host)
    1211                 return -ENOMEM;
    1212 
    1213         pcie = pci_host_bridge_priv(host);
    1214 
    1215         pcie->dev = dev;
    1216         pcie->soc = device_get_match_data(dev);
    1217         platform_set_drvdata(pdev, pcie);
    1218 
    1219         err = mtk_pcie_setup_irq(pcie);
    1220         if (err)
    1221                 return dev_err_probe(dev, err, "Failed to setup IRQ domains\n");
    1222 
    1223         err = pci_pwrctrl_create_devices(pcie->dev);
    1224         if (err) {
    1225                 goto err_tear_down_irq;
--> 1226                 dev_err_probe(dev, err, "failed to create pwrctrl devices\n");

The error message is unreachable.

    1227         }
    1228 
    1229         err = mtk_pcie_setup(pcie);

This email is a free service from the Smatch-CI project [smatch.sf.net].

regards,
dan carpenter

