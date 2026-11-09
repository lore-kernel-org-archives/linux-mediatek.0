Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CEF4606A31C
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Nov 2026 15:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DetpAeM5;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=KrVbrHBa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=InNwYIMIJI8yrg6o/8hogQFe84wdeKa70SPggHPT1Ps=; b=DetpAeM5vwJTGI
	7+nAnLNl9zoj5PX3xNuV6qK2rWpWO89dqf9kvKvXwFNhYtl/S2+TTqYNU56he66IoCKXcgvQxUWKJ
	L0GFjPIvtl3Q20n122+eJl38GlfuUdsZ2GBg/QkYcZqbMNLfnnt8fddxNIFhP6JBy2bmKkWUjhpRY
	bKIvQ66Egw3SOp9+rKd5D9v2iFDu3UaH09kgt4Q008jbDZuMczlX9INO7xT8iZVL4m7+xOzB1IV2A
	ixWOZQilbdYioQmansBhEfHVo3LDegxPXpOaHbTaQVdlTcZ8LsFfCxMieLk1PdGn/DTKxVj3qEo4x
	JH3OiQeaXVx40P5VJpIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQQy2-0000000119J-2rfu;
	Mon, 09 Nov 2026 15:07:30 +0000
Received: from m16.mail.163.com ([117.135.210.2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQQxq-0000000117w-2q1j
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Nov 2026 15:07:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=InNwYIMIJI8yrg6o/8hogQFe84wdeKa70SPggHPT1Ps=;
	b=KrVbrHBatWN5A+oE+H9yy3Vf4NfkgY3u8Rj2HFxCrfy7EdplXfSt70HWWcZLwh
	/C6WnH1r7rLfVgoW1FY1zaLGFzyd7dn95MxfK1IloYJhY6mNWLvFrOOKJCksyygH
	nw9KRh5w9N9Ue+WQ5j+8iur5GXJoCi6j7QcxLNX0lZ4Vk=
Received: from [IPV6:240e:b8f:91b3:d000:f8a3:659e:94ea:8cfa] (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wD39xp74fFqmq84GA--.54682S2;
	Mon, 09 Nov 2026 23:06:36 +0800 (CST)
Message-ID: <ad7ad5ed-bf3f-40b2-97c4-fbd6f35acd3d@163.com>
Date: Mon, 9 Nov 2026 23:06:36 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] PCI: Use pcie_get_link_speed() in pci.c
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: bhelgaas@google.com, mani@kernel.org, lpieralisi@kernel.org,
 kwilczynski@kernel.org, thierry.reding@kernel.org, ryder.lee@mediatek.com,
 jonathanh@nvidia.com, robh@kernel.org, linux-pci@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, linux-mediatek@lists.infradead.org,
 linux-tegra@vger.kernel.org
References: <20261108094034.679945-1-18255117159@163.com>
 <20261108094034.679945-2-18255117159@163.com>
 <43198b7a-b0f7-49e4-731a-807e7d9e5959@linux.intel.com>
Content-Language: en-US
From: Hans Zhang <18255117159@163.com>
In-Reply-To: <43198b7a-b0f7-49e4-731a-807e7d9e5959@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD39xp74fFqmq84GA--.54682S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxCrWfAw18uryfWF48GFWUCFg_yoWrWrykpa
	y7C3WYyF1UJr1fWF4Fqan8ur15X3ZxZrWxJrySka4kWr12yrZ3XFy0q3yayr1Syr4DAry5
	A3ZIyrs8uan7tFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRepBDUUUUU=
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbC7ByuUmrx4XyrPAAA3d
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_070721_844215_8339511A 
X-CRM114-Status: GOOD (  12.77  )
X-Spam-Score: -1.8 (-)
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
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,FROM_LOCAL_DIGITS,FROM_LOCAL_HEX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/9/26 20:03, Ilpo Järvinen wrote:
> On Sun, 8 Nov 2026, Hans Zhang wrote:
> 
>> Replace the to_pcie_link_speed() wrapper with pcie_get_link_speed() in
>> pcie_link_bandwidth_mbps() and pcie_bandwidth_available(), and remove
>> the now-unused wrapper.  pcie_get_link_speed() performs the same lookup
>> with bounds checking and is already exported.
>>
>> Signed-off-by: Hans Zhang <18255117159@163.com>
>> ---
>>   drivers/pci/pci.c | 9 ++-------
>>   1 file changed, 2 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
>> index 7c6f2aba8144..92ede1768caf 100644
>> --- a/drivers/pci/pci.c
>> +++ b/drivers/pci/pci.c
>> @@ -6025,11 +6025,6 @@ int pcie_set_mps(struct pci_dev *dev, int mps)
>>   }
>>   EXPORT_SYMBOL(pcie_set_mps);
>>   
>> -static enum pci_bus_speed to_pcie_link_speed(u16 lnksta)
>> -{
>> -	return pcie_link_speed[FIELD_GET(PCI_EXP_LNKSTA_CLS, lnksta)];
>> -}
>> -
>>   /**
>>    * pcie_link_bandwidth_mbps - get the current bandwidth of a single PCIe link
>>    * @pdev: PCI device to query
>> @@ -6048,7 +6043,7 @@ int pcie_link_bandwidth_mbps(struct pci_dev *pdev)
>>   	if (err)
>>   		return pcibios_err_to_errno(err);
>>   
>> -	speed = pcie_dev_speed_mbps(to_pcie_link_speed(lnksta));
>> +	speed = pcie_dev_speed_mbps(pcie_get_link_speed(FIELD_GET(PCI_EXP_LNKSTA_CLS, lnksta)));
> 
> Readability seems worse due to cramming everything into a single
> statement.

Hello Ilpo,

Agreed. I'll split the link speed class into a separate local variable
at both call sites, keeping lnksta intact for the link width extraction.

I'll send v3 of the series with this change.


diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index 7c6f2aba8144..594ee7aa4cad 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -6025,11 +6025,6 @@ int pcie_set_mps(struct pci_dev *dev, int mps)
  }
  EXPORT_SYMBOL(pcie_set_mps);

-static enum pci_bus_speed to_pcie_link_speed(u16 lnksta)
-{
-	return pcie_link_speed[FIELD_GET(PCI_EXP_LNKSTA_CLS, lnksta)];
-}
-
  /**
   * pcie_link_bandwidth_mbps - get the current bandwidth of a single 
PCIe link
   * @pdev: PCI device to query
@@ -6041,14 +6036,15 @@ static enum pci_bus_speed to_pcie_link_speed(u16 
lnksta)
   */
  int pcie_link_bandwidth_mbps(struct pci_dev *pdev)
  {
-	u16 lnksta;
+	u16 lnksta, lnksta_cls;
  	int speed, err;

  	err = pcie_capability_read_word(pdev, PCI_EXP_LNKSTA, &lnksta);
  	if (err)
  		return pcibios_err_to_errno(err);

-	speed = pcie_dev_speed_mbps(to_pcie_link_speed(lnksta));
+	lnksta_cls = FIELD_GET(PCI_EXP_LNKSTA_CLS, lnksta);
+	speed = pcie_dev_speed_mbps(pcie_get_link_speed(lnksta_cls));
  	if (speed < 0)
  		return speed;

@@ -6074,7 +6070,7 @@ u32 pcie_bandwidth_available(struct pci_dev *dev, 
struct pci_dev **limiting_dev,
  			     enum pci_bus_speed *speed,
  			     enum pcie_link_width *width)
  {
-	u16 lnksta;
+	u16 lnksta, lnksta_cls;
  	enum pci_bus_speed next_speed;
  	enum pcie_link_width next_width;
  	u32 bw, next_bw;
@@ -6089,7 +6085,8 @@ u32 pcie_bandwidth_available(struct pci_dev *dev, 
struct pci_dev **limiting_dev,
  	while (dev) {
  		pcie_capability_read_word(dev, PCI_EXP_LNKSTA, &lnksta);

-		next_speed = to_pcie_link_speed(lnksta);
+		lnksta_cls = FIELD_GET(PCI_EXP_LNKSTA_CLS, lnksta);
+		next_speed = pcie_get_link_speed(lnksta_cls);
  		next_width = FIELD_GET(PCI_EXP_LNKSTA_NLW, lnksta);

  		next_bw = next_width * PCIE_SPEED2MBS_ENC(next_speed);




Best regards,
Hans



> 
>>   	if (speed < 0)
>>   		return speed;
>>   
>> @@ -6089,7 +6084,7 @@ u32 pcie_bandwidth_available(struct pci_dev *dev, struct pci_dev **limiting_dev,
>>   	while (dev) {
>>   		pcie_capability_read_word(dev, PCI_EXP_LNKSTA, &lnksta);
>>   
>> -		next_speed = to_pcie_link_speed(lnksta);
>> +		next_speed = pcie_get_link_speed(FIELD_GET(PCI_EXP_LNKSTA_CLS, lnksta));
>>   		next_width = FIELD_GET(PCI_EXP_LNKSTA_NLW, lnksta);
>>   
>>   		next_bw = next_width * PCIE_SPEED2MBS_ENC(next_speed);
>>
> 


