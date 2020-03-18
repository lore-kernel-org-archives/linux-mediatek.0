Return-Path: <SRS0=5sS2=5D=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,FAKE_REPLY_C,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10350C4332D
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Mar 2020 22:23:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D468C2076C
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Mar 2020 22:23:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tCcMEpO5";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="TeaROXeq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D468C2076C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=ttYoj338iMZPFkrJGL5OzqupWfZ/yp2kO+NEaDoNfO8=; b=tCcMEpO5cN3T3c
	9DB9nScemybGKzU6Y6zJVp7z2Pz8z3oX+z8rlqCKp8ri3GsAW32RbP8kTAAciiU4V4nYhTYa99IoA
	IYgRmhOJb63jWU0+d0aoWldtt7L7wGTAkStgSTgRbMOZt9Ci+uHkPp+Eq05vvGwCVnkB+tkka10QN
	GH9qo6Vh9mwCnVHBmo+5gQI2CV1kuZHLMYpgOAHYgTIonVMVpKN71fMv/rnHv8k5nBE8pJqRIKjcg
	c11veNu7/nChPPdsdbeoOluJWbXBcjIB1L//AAULnSjMmR5eWKUpSXiskNIJ6okpOGBUCP/IA624v
	KJbCjbxvrWkUDKwFdS3Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jEh5Q-0004cv-Rn; Wed, 18 Mar 2020 22:22:52 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jEh5F-0004Rz-EY; Wed, 18 Mar 2020 22:22:42 +0000
Received: from localhost (mobile-166-175-186-165.mycingular.net
 [166.175.186.165])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6804D20714;
 Wed, 18 Mar 2020 22:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584570160;
 bh=Xz/0EvZI1ZYMODHoYRMl9J+dOM/tsbfHznYvsE+DY4A=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=TeaROXeqtIiOuPZEJEeYWnIPHrh1Ask7srNIxIYhwTpKsUqP2jP8EVgIYJM33HfwF
 1jFMhhapjJedYXzGwqqv6NFwF3Nch7XWO1iNLYfMzXCjEK5TU34+g7gYssJdkFOM1b
 DGF8UtEi5MxA8pPt6Acsc8nHRD8W/OlpKBw98Rb4=
Date: Wed, 18 Mar 2020 17:22:38 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH 4/5] pci: handled return value of platform_get_irq
 correctly
Message-ID: <20200318222238.GA247500@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <874kulbwyv.fsf@nanos.tec.linutronix.de>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200318_152241_531567_CF88EEF6 
X-CRM114-Status: GOOD (  19.24  )
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
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>,
 Marc Gonzalez <marc.w.gonzalez@free.fr>, linux-pci@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>,
 Aman Sharma <amanharitsh123@gmail.com>, linux-kernel@vger.kernel.org,
 Ryder Lee <ryder.lee@mediatek.com>, linux-mediatek@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Marc Zyngier <maz@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Mans Rullgard <mans@mansr.com>,
 Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, linux-arm-kernel@lists.infradead.org,
 Andrew Murray <amurray@thegoodpenguin.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Mar 18, 2020 at 02:42:48PM +0100, Thomas Gleixner wrote:
> Bjorn Helgaas <helgaas@kernel.org> writes:
> > On Fri, Mar 13, 2020 at 04:56:42PM -0500, Bjorn Helgaas wrote:
> >> On Fri, Mar 13, 2020 at 10:05:58PM +0100, Thomas Gleixner wrote:
> >> > >   I think the best pattern is:
> >> > >
> >> > >     irq = platform_get_irq(pdev, i);
> >> > >     if (irq < 0)
> >> > >       return irq;
> >> > 
> >> > Careful. 0 is not a valid interrupt.
> >> 
> >> Should callers of platform_get_irq() check for a 0 return value?
> >> About 900 of them do not.
> 
> I don't know what I was looking at.
> 
> platform_get_irq() does the right thing already, so checking for irq < 0
> is sufficient.
> 
> Sorry for the confusion!

Thanks, I was indeed confused!  Maybe we could reduce future confusion
by strengthening the comments slightly, e.g.,

  - * Return: IRQ number on success, negative error number on failure.
  + * Return: non-zero IRQ number on success, negative error number on failure.

I don't want to push my luck, but it's pretty hard to prove that
platform_get_irq() never returns 0.  What would you think of something
like the following?

@@ -133,23 +133,24 @@ EXPORT_SYMBOL_GPL(devm_platform_ioremap_resource_byname);
  *		if (irq < 0)
  *			return irq;
  *
- * Return: IRQ number on success, negative error number on failure.
+ * Return: non-zero IRQ number on success, negative error number on failure.
  */
 int platform_get_irq_optional(struct platform_device *dev, unsigned int num)
 {
+	int ret;
 #ifdef CONFIG_SPARC
 	/* sparc does not have irqs represented as IORESOURCE_IRQ resources */
 	if (!dev || num >= dev->archdata.num_irqs)
 		return -ENXIO;
-	return dev->archdata.irqs[num];
+	ret = dev->archdata.irqs[num];
+	goto out;
 #else
 	struct resource *r;
-	int ret;
 
 	if (IS_ENABLED(CONFIG_OF_IRQ) && dev->dev.of_node) {
 		ret = of_irq_get(dev->dev.of_node, num);
 		if (ret > 0 || ret == -EPROBE_DEFER)
-			return ret;
+			goto out;
 	}
 
 	r = platform_get_resource(dev, IORESOURCE_IRQ, num);
@@ -157,7 +158,7 @@ int platform_get_irq_optional(struct platform_device *dev, unsigned int num)
 		if (r && r->flags & IORESOURCE_DISABLED) {
 			ret = acpi_irq_get(ACPI_HANDLE(&dev->dev), num, r);
 			if (ret)
-				return ret;
+				goto out;
 		}
 	}
 
@@ -171,13 +172,17 @@ int platform_get_irq_optional(struct platform_device *dev, unsigned int num)
 		struct irq_data *irqd;
 
 		irqd = irq_get_irq_data(r->start);
-		if (!irqd)
-			return -ENXIO;
+		if (!irqd) {
+			ret = -ENXIO;
+			goto out;
+		}
 		irqd_set_trigger_type(irqd, r->flags & IORESOURCE_BITS);
 	}
 
-	if (r)
-		return r->start;
+	if (r) {
+		ret = r->start;
+		goto out;
+	}
 
 	/*
 	 * For the index 0 interrupt, allow falling back to GpioInt
@@ -190,11 +195,14 @@ int platform_get_irq_optional(struct platform_device *dev, unsigned int num)
 		ret = acpi_dev_gpio_irq_get(ACPI_COMPANION(&dev->dev), num);
 		/* Our callers expect -ENXIO for missing IRQs. */
 		if (ret >= 0 || ret == -EPROBE_DEFER)
-			return ret;
+			goto out;
 	}
 
-	return -ENXIO;
+	ret = -ENXIO;
 #endif
+out:
+	WARN(ret == 0, "0 is an invalid IRQ number\n");
+	return ret;
 }
 EXPORT_SYMBOL_GPL(platform_get_irq_optional);
 
@@ -212,7 +220,7 @@ EXPORT_SYMBOL_GPL(platform_get_irq_optional);
  *		if (irq < 0)
  *			return irq;
  *
- * Return: IRQ number on success, negative error number on failure.
+ * Return: non-zero IRQ number on success, negative error number on failure.
  */
 int platform_get_irq(struct platform_device *dev, unsigned int num)
 {
@@ -284,8 +292,10 @@ static int __platform_get_irq_byname(struct platform_device *dev,
 	}
 
 	r = platform_get_resource_byname(dev, IORESOURCE_IRQ, name);
-	if (r)
+	if (r) {
+		WARN(r->start == 0, "0 is an invalid IRQ number\n");
 		return r->start;
+	}
 
 	return -ENXIO;
 }
@@ -297,7 +307,7 @@ static int __platform_get_irq_byname(struct platform_device *dev,
  *
  * Get an IRQ like platform_get_irq(), but then by name rather then by index.
  *
- * Return: IRQ number on success, negative error number on failure.
+ * Return: non-zero IRQ number on success, negative error number on failure.
  */
 int platform_get_irq_byname(struct platform_device *dev, const char *name)
 {
@@ -319,7 +329,7 @@ EXPORT_SYMBOL_GPL(platform_get_irq_byname);
  * Get an optional IRQ by name like platform_get_irq_byname(). Except that it
  * does not print an error message if an IRQ can not be obtained.
  *
- * Return: IRQ number on success, negative error number on failure.
+ * Return: non-zero IRQ number on success, negative error number on failure.
  */
 int platform_get_irq_byname_optional(struct platform_device *dev,
 				     const char *name)

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
