From: Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: pwm: Convert PWM bindings to
 json-schema
Date: Thu, 03 Oct 2019 11:15:59 -0700
Message-ID: <20191003181600.7D6F22070B__30096.9784542517$1570126585$gmane$org@mail.kernel.org>
References: <20191002164047.14499-1-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20191002164047.14499-1-krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: =?UTF-8?Q?Uwe=20Kleine=2DK=C3=83=C2=B6nig=20=3Cu=2E?=
Cc: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

Quoting Krzysztof Kozlowski (2019-10-02 09:40:46)
> Convert generic PWM bindings to DT schema format using json-schema.  The
> consumer bindings are split to separate file.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> 
> ---
> 
> Changes since v2:
> 1. Change also pwm-sprd.txt
> 
> Changes since v1:
> 1. Indent example with four spaces (more readable),
> 2. Change pattern for pwm nodes,
> 3. Remove $ref from #cells.
> ---
>  .../devicetree/bindings/clock/pwm-clock.txt   |  2 +-

Acked-by: Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
