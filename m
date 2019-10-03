From: sboyd@kernel.org (Stephen Boyd)
Date: Thu, 03 Oct 2019 11:15:59 -0700
Subject: [PATCH v3 1/2] dt-bindings: pwm: Convert PWM bindings to
 json-schema
In-Reply-To: <20191002164047.14499-1-krzk@kernel.org>
References: <20191002164047.14499-1-krzk@kernel.org>
List-Id: linux-mediatek@lists.infradead.org
Message-ID: <20191003181600.7D6F22070B@mail.kernel.org>
To: linux-mediatek@lists.infradead.org

Quoting Krzysztof Kozlowski (2019-10-02 09:40:46)
> Convert generic PWM bindings to DT schema format using json-schema.  The
> consumer bindings are split to separate file.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk at kernel.org>
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

Acked-by: Stephen Boyd <sboyd at kernel.org>
